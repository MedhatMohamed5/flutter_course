import 'dart:convert';

import 'package:flutter_course/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationAPI {
  Future<bool> login(String email, String password) async {
    String authApi = base_api + authentication;
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    };
    Map<String, String> body = {
      "email": email,
      "password": password,
    };
    try {
      var response = await http.post(authApi, headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        var token = data['token'];
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
        print(token);
        return true;
      } else {
        print(response.body);
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
