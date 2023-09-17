import 'dart:convert';

import 'package:adress_book/models/request/auth/login_model.dart';
import 'package:adress_book/models/request/auth/profile_update_model.dart';
import 'package:adress_book/models/request/auth/signup_model.dart';
import 'package:adress_book/models/response/login_res_model.dart';
import 'package:adress_book/models/response/profile_model.dart';
import 'package:adress_book/services/config.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = http.Client();

  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.loginUrl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = loginResponseModelFromJson(response.body).userToken;
      String userId = loginResponseModelFromJson(response.body).id;
      String profile = loginResponseModelFromJson(response.body).profile;

      await prefs.setString('token', token);
      await prefs.setString('userId', userId);
      await prefs.setString('profile', profile);
      await prefs.setBool('loggedIn', true);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> signup(SignupModel model) async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
      var url = Uri.http(Config.apiUrl, Config.signupUrl);

      print('Sending POST request to: $url');
      print('Request headers: $requestHeaders');
      print('Request body: ${jsonEncode(model)}');

      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Error during signup: $error');
      return false;
    }
  }

  static Future<bool> updateProfile(ProfileUpdateReq model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    if (token == null) {
      print("Token is null. Please log in first.");
      return false;
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var url = Uri.http(Config.apiUrl, '${Config.profileUrl}/$userId');

    try {
      var response = await http.put(
        url,
        headers: requestHeaders,
        body: jsonEncode(model),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("Update Profile Error: ${response.statusCode}");
        print("Error response body: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception during network request: $e");
      return false;
    }
  }

  static Future<ProfileRes> getProfile() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String? userId = prefs.getString('userId');

      if (token == null) {
        throw Exception("Token is null. Authentication required.");
      }

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'token': 'Bearer $token'
      };

      var url = Uri.http(Config.apiUrl, '${Config.profileUrl}$userId');

      print('Fetching profile from: $url');

      var response = await client.get(
        url,
        headers: requestHeaders,
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var profile = profileResFromJson(response.body);
        return profile;
      } else {
        throw Exception(
            "Failed to get the profile. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error during profile retrieval: $error');
      throw Exception("Failed to get the profile. Error: $error");
    }
  }
}
