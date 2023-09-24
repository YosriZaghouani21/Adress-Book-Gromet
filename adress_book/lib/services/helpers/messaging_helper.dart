import 'dart:convert';

import 'package:adress_book/models/request/messaging/send_message.dart';
import 'package:adress_book/models/response/messaging/messaging_res.dart';
import 'package:adress_book/services/config.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class MesssagingHelper {
  static var client = http.Client();

  // Apply for job
  static Future<List<dynamic>> sendMessage(SendMessage model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.http('${Config.apiUrl}', '${Config.messagingUrl}/$userId');
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      ReceivedMessge message =
          ReceivedMessge.fromJson(jsonDecode(response.body));

      Map<String, dynamic> responseMap = jsonDecode(response.body);
      return [true, message, responseMap];
    } else {
      return [false];
    }
  }

  static Future<List<ReceivedMessge>> getMessages(
      String chatId, int offset) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.http(Config.apiUrl, "${Config.messagingUrl}/$chatId",
        {"page": offset.toString()});
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var messages = receivedMessgeFromJson(response.body);

      return messages;
    } else {
      throw Exception(" failed to load messages");
    }
  }
}
