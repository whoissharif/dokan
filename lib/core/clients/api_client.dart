import 'dart:async';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> getRequest(
    String url, {
    Map<String, String>? headers,
  }) async {
    return http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  Future<http.Response> postRequest(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    return http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
  }
}
