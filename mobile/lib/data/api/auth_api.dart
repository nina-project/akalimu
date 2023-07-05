// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:akalimu/data/models/auth_object.dart';
import 'package:akalimu/data/models/client.dart';
import 'package:http/http.dart' as http;

import '../local_preferences.dart';
import '../query_params.dart';
import 'api.dart';

class AuthAPI {
  final String loginAPIEndpoint = "$baseAPIUrl/login";
  final String registerAPIEndpoint = "$baseAPIUrl/register";
  final String usersAPIEndpoint = "$baseAPIUrl/users";

  Future refreshToken() async {
    final LocalPreferences localPreferences = LocalPreferences();
    String? email = localPreferences.userData?.email;
    String? password = await localPreferences.userPassword;

    if (email != null && password != null) {
      final AuthObject? authObject = await login(
        email: email,
        password: password,
      );
      if (authObject?.accessToken != null) {
        await localPreferences.setUserToken(authObject!.accessToken!);
      }
    }
  }

  Future<AuthObject?> login(
      {required String email, required String password}) async {
    Map<String, dynamic> credentials = {
      "email": email,
      "password": password,
    };
    try {
      http.Response response =
          await postToEndpoint(loginAPIEndpoint, credentials);
      Map<String, dynamic> json = jsonDecode(response.body);
      AuthObject authObject = AuthObject(
        email: email,
        password: password,
        accessToken: json['access_token'],
      );
      return authObject;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<AuthObject?> register(AuthObject authObject) async {
    try {
      http.Response response =
          await postToEndpoint(registerAPIEndpoint, authObject.toMap());
      Map<String, dynamic> json = jsonDecode(response.body);
      return authObject.copyWith(accessToken: json['access_token']);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Client>> getAll(QueryParams params) async {
    try {
      http.Response response =
          await getFromEndpoint(usersAPIEndpoint, params: params);
      if (response.statusCode == 200) {
        return clientsFromJson(response.body);
      } else {
        return Future.error('Failed to load Users from API');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Client?> getUserData(String? email) async {
    //this is temporary logic to get user data. it needs to be redone wth proper way after back end is fixed. and search feature added.
    //that way, we can search the db for a user with the email, instead of getting all users and filtering them.
    try {
      List<Client> allUserData =
          await getAll(UsersQueryParams(filter: ClientsQueryParams.filterAll));
      Client? userData =
          allUserData.firstWhere((element) => element.email == email);
      return userData;
    } catch (e) {
      return Future.error(e);
    }
  }
}
