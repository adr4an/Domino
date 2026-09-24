import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  // Replace with your API base URL
  static const String _baseUrl = 'https://your-api-base-url.com';

  /// Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  /// Helper method to make a POST request
  static Future<Map<String, dynamic>> post(
    String endpoint,
    dynamic data,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  /// Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  /// Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  /// Handles the HTTP response, decoding JSON or throwing an error
  static Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      if (response.body.isEmpty) return {};
      return json.decode(response.body) as Map<String, dynamic>;
    } else if (statusCode == 400) {
      throw 'Bad request. Please check your input.';
    } else if (statusCode == 401) {
      throw 'Unauthorized. Please log in again.';
    } else if (statusCode == 403) {
      throw 'Forbidden. You don\'t have permission to access this.';
    } else if (statusCode == 404) {
      throw 'Requested resource not found.';
    } else if (statusCode == 500) {
      throw 'Internal server error. Please try again later.';
    } else {
      throw 'Something went wrong. Status code: $statusCode';
    }
  }
}
