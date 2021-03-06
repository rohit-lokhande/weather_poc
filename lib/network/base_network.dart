import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static String baseUrl = "http://api.openweathermap.org/data/2.5";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    String fullUrl = baseUrl;
    if (partUrl.isNotEmpty) {
      fullUrl = '$baseUrl/$partUrl';
    }
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    if (response.body.isNotEmpty) {
      final jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }
}
