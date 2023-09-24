import 'dart:convert';

import 'package:adress_book/models/request/chat/create_chat.dart';
import 'package:adress_book/models/response/chat/get_chat.dart';
import 'package:adress_book/models/response/chat/initial_msg.dart';
import 'package:adress_book/services/config.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class ChatHelper {
  static var client = http.Client();

  // Open a chat
  static Future<List<dynamic>> apply(CreateChat model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.http('${Config.apiUrl}', '${Config.chatsUrl}/$userId');
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var first = initialChatFromJson(response.body).id;

      return [true, first];
    } else {
      return [false];
    }
  }

  static Future<List<GetChats>> getConversations() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    print('User ID: $userId'); // Add this line to print userId for debugging

    if (token == null || userId == null) {
      print('Token or User ID is null.');
      throw Exception("Token or User ID is null.");
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.http('${Config.apiUrl}', '${Config.chatsUrl}/$userId');
    print(
        'Constructed URL: $url'); // Add this line to print constructed URL for debugging

    try {
      var response = await client.get(
        url,
        headers: requestHeaders,
      );

      print(
          'HTTP Response Code: ${response.statusCode}'); // Add this line to print HTTP response code for debugging
      print(
          'HTTP Response Body: ${response.body}'); // Add this line to print HTTP response body for debugging

      if (response.statusCode == 200) {
        var chats = getChatsFromJson(response.body);
        return chats;
      } else {
        throw Exception(
            "Couldn't load chats. HTTP status code: ${response.statusCode}");
      }
    } catch (e) {
      print(
          'Error: $e'); // Add this line to print any caught exceptions for debugging
      rethrow; // Rethrow the exception for handling higher up the call stack if needed
    }
  }
}
