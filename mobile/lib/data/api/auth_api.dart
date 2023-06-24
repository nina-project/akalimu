import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:akalimu/data/models/user_data.dart';

import 'api.dart';

class AuthAPI {
  final String loginAPIEndpoint = "$baseAPIUrl/login";
  final String registerAPIEndpoint = "$baseAPIUrl/register";
  final String usersAPIEndpoint = "$baseAPIUrl/users";

  Future<String?> login(
      {required String email, required String password}) async {
    Map<String, dynamic> credentials = {
      "email": email,
      "password": password,
    };
    try {
      http.Response response =
          await postToEndpoint(loginAPIEndpoint, credentials);
      Map<String, dynamic> json = jsonDecode(response.body);
      return json['access_token'];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserData> register(UserData userData) async {
    try {
      http.Response response =
          await postToEndpoint(registerAPIEndpoint, userData.toMap());
      Map<String, dynamic> json = jsonDecode(response.body);
      return userData.copyWith(token: json['access_token']);
    } catch (e) {
      return Future.error(e);
    }
  }

  // Future<UserData?> getUserData(String email) async {
  //   try {
  //     // http.Response response =
  //     //     await getFromEndpoint("$usersAPIEndpoint/$id");
  //     return UserData.fromJson(jsonDecode(response.body));
  //   } catch (e) {
  //     return Future.error(e);
  //   }
  // }
}
