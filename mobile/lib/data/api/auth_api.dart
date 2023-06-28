import 'dart:convert';

import 'package:akalimu/data/models/user_data.dart';
import 'package:http/http.dart' as http;

import '../query_params.dart';
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

  Future<List<UserData>> getAll(QueryParams params) async {
    try {
      http.Response response =
          await getFromEndpoint(usersAPIEndpoint, params: params);
      if (response.statusCode == 200) {
        return usersFromJson(response.body);
      } else {
        return Future.error('Failed to load Users from API');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserData?> getUserData(String? email) async {
    //this is temporary logic to get user data. it needs to be redone wth proper way after back end is fixed. and search feature added.
    //that way, we can search the db for a user with the email, instead of getting all users and filtering them.
    try {
      List<UserData> allUserData =
          await getAll(UsersQueryParams(filter: ClientsQueryParams.filterAll));
      UserData? userData =
          allUserData.firstWhere((element) => element.email == email);
      return userData;
    } catch (e) {
      return Future.error(e);
    }
  }
}
