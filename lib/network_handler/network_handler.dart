import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:video_streaming_ui/network_handler/custom_error.dart';

const String host = '10.0.2.2:3000 ';
const String baseUrl = 'api/v0/';

class NetworkHandler {
  static Future<http.Response> get(
      String url, Map<String, dynamic> queryParameters) async {
    final uri = Uri.https(baseUrl, url, queryParameters);
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }
    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body) async {
    final uri = Uri.http(host, baseUrl + url);
    log('uri ---> $uri');
    log('body ---> $body');
    final request = http.Request('POST', uri);
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(body);
    final response = await http.Client().send(request);
    if (response.statusCode != 201) {
      final customError = json.decode(await response.stream.bytesToString());
      log('customError ---> $customError');
      final customNetworkError = CustomNetworkError.fromJson(customError);
      throw customNetworkError;
    }
    final responseBody = await response.stream.bytesToString();
    return json.decode(responseBody);
  }
}
