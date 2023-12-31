import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../local_preferences.dart';
import '../query_params.dart';
import 'auth_api.dart';

const String hostUrl = "http://127.0.0.1:8000";
const String baseAPIUrl = "$hostUrl/api/v1";

Future<String?> getIdToken() async {
  final String? idToken = LocalPreferences().userToken;
  return idToken;
}

Future<Map<String, String>> getHeaders() async {
  final String? idToken = await getIdToken();
  return {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $idToken',
  };
}

Future<http.Response> getFromEndpoint(String endpoint,
    {QueryParams? params, Map<String, String>? customHeaders}) async {
  // Add query params to endpoint
  if (params != null) {
    endpoint = appendQueryParams(endpoint, params);
  }

  // Create authorization header
  final header = customHeaders ?? await getHeaders();

  final response = await http.get(
    Uri.parse(endpoint),
    headers: header,
  );

  // if (kDebugMode) {
  //   print("_\nGET:$endpoint RESPONSE:::::\n${response.body}");
  // }

  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 401) {
    try {
      await AuthAPI().refreshToken();
      return getFromEndpoint(endpoint, params: params);
    } catch (e) {
      return Future.error(e);
    }
  } else {
    throw Exception(const JsonDecoder().convert(response.body)['message']);
  }
}

Future<http.Response> postToEndpoint(
    String endpoint, Map<String, dynamic> object) async {
  final header = await getHeaders();
  final response = await http.post(
    Uri.parse(endpoint),
    headers: header,
    body: jsonEncode(object),
  );

  // if (kDebugMode) {
  //   print("_\nPOST:$endpoint RESPONSE:::\n ${response.body}");
  // }

  if (response.statusCode == 200 || response.statusCode == 201) {
    return response;
  } else if (response.statusCode == 401) {
    try {
      await AuthAPI().refreshToken();
      return postToEndpoint(endpoint, object);
    } catch (e) {
      return Future.error(e);
    }
  } else {
    throw Exception(const JsonDecoder().convert(response.body)['message']);
  }
}

Future<http.Response> patchToEndpoint(String endpoint, dynamic object) async {
  final header = await getHeaders();

  final response = await http.patch(
    Uri.parse(endpoint),
    headers: header,
    body: jsonEncode(object),
  );

  // if (kDebugMode) {
  //   print("_\nPUT:$endpoint RESPONSE:::\n ${response.body}");
  // }

  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 401) {
    try {
      await AuthAPI().refreshToken();
      return patchToEndpoint(endpoint, object);
    } catch (e) {
      return Future.error(e);
    }
  } else {
    return Future.error(const JsonDecoder().convert(response.body)['message']);
  }
}

Future<http.Response> deleteFromEndpoint(String endpoint) async {
  final header = await getHeaders();
  final response = await http.delete(
    Uri.parse(endpoint),
    headers: header,
  );
  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 401) {
    try {
      await AuthAPI().refreshToken();
      return deleteFromEndpoint(endpoint);
    } catch (e) {
      return Future.error(e);
    }
  } else {
    throw Exception(const JsonDecoder().convert(response.body)['message']);
  }
}

String appendQueryParams(String endpoint, QueryParams params) {
  String queryParams = '';
  params.params.forEach((key, value) {
    if (value != null) {
      queryParams += '$key=$value&';
    }
  });
  if (queryParams.isNotEmpty) {
    queryParams = queryParams.substring(0, queryParams.length - 1);
    endpoint += '?$queryParams';
  }
  return endpoint;
}
