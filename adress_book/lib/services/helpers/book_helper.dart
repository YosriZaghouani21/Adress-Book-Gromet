import 'dart:convert';

import 'package:adress_book/models/request/bookmarks/bookmarks_model.dart';
import 'package:adress_book/models/response/bookmarks/all_bookmarks.dart';
import 'package:adress_book/models/response/bookmarks/book_res.dart';
import 'package:adress_book/services/config.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class BookMarkHelper {
  static var client = http.Client();

// ADD BOOKMARKS
  static Future<List<dynamic>> addBookmarks(BookmarkReqResModel model) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String? userId = prefs.getString('userId');

      if (token == null) {
        return [false, 'Token not available']; // Handle token not available
      }

      // Define request headers with Content-Type and Authorization
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      // Define the URL using Uri.parse for a valid URL
      var url =
          Uri.parse('http://${Config.apiUrl}${Config.bookmarkUrl}/$userId');

      // Send the POST request
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        // Parse the response JSON and extract bookmark ID
        String bookmarkId = bookMarkReqResFromJson(response.body).id;
        return [true, bookmarkId];
      } else {
        print('HTTP status ${response.statusCode}');
        print('Response body: ${response.body}');
        return [
          false,
          'HTTP status ${response.statusCode}'
        ]; // Handle non-200 status
      }
    } catch (e) {
      print('Error in addBookmarks: $e');
      return [false, 'An error occurred. Please try again.'];
    }
  }

  // DELETE BOOKMARKS
  static Future<bool> deleteBookmarks(String jobId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        throw Exception('Token not found in SharedPreferences');
      }

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'token': 'Bearer $token'
      };

      var url = Uri.http(Config.apiUrl, "${Config.bookmarkUrl}/$jobId");
      print('URL: $url');
      print('Request Headers: $requestHeaders');

      var response = await client.delete(
        url,
        headers: requestHeaders,
      );

      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Error deleting bookmarks: $error');
      throw Exception('Error deleting bookmarks: $error');
    }
  }

  // GET ALL BOOKMARKS
  static Future<List<AllBookmark>> getBookmarks() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String? userId = prefs.getString('userId');

      if (token == null) {
        throw Exception('Token not found in SharedPreferences');
      }

      // If userId is null, handle it accordingly (you may throw an exception or choose a default behavior)
      if (userId == null) {
        throw Exception('User ID not found in SharedPreferences');
      }

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'token': 'Bearer $token'
      };

      var url = Uri.http('${Config.apiUrl}', '${Config.bookmarkUrl}/$userId');
      print('URL: $url');
      print('Request Headers: $requestHeaders');

      var response = await client.get(
        url,
        headers: requestHeaders,
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var bookmarks = allBookmarkFromJson(response.body);
        print('Parsed Bookmarks: $bookmarks');
        return bookmarks;
      } else {
        throw Exception(
            'Failed to load bookmarks. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching bookmarks: $error');
      throw Exception('Error fetching bookmarks: $error');
    }
  }
}
