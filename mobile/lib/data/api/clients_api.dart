import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/client.dart';
import '../query_params.dart';
import 'api.dart';

class ClientsAPI {
  final String clientsAPIEndpoint = "$baseAPIUrl/users";

  Future<List<Client>> getAll(QueryParams params) async {
    try {
      http.Response response =
          await getFromEndpoint(clientsAPIEndpoint, params: params);
      if (response.statusCode == 200) {
        return clientsFromJson(response.body);
      } else {
        return Future.error('Failed to load Clients from API');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Client> getOne(int id) async {
    try {
      http.Response response = await getFromEndpoint("$clientsAPIEndpoint/$id");
      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        return Client.fromMap(map['data']);
      } else {
        return Future.error('Failed to load Client from API');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Client> insert(Client value) async {
    try {
      http.Response response =
          await postToEndpoint(clientsAPIEndpoint, value.toMap());
      Map<String, dynamic> json = jsonDecode(response.body);
      return Client.fromJson(json["data"]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> delete(Client value) async {
    await deleteFromEndpoint("$clientsAPIEndpoint/${value.id}");
  }
}
