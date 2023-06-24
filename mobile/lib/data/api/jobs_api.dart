import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/job.dart';
import '../query_params.dart';
import 'api.dart';

class JobsAPI {
  final String jobsAPIEndpoint = "$baseAPIUrl/jobs";

  Future<List<Job>> getAll(QueryParams params) async {
    try {
      http.Response response =
          await getFromEndpoint(jobsAPIEndpoint, params: params);
      if (response.statusCode == 200) {
        return jobsFromJson(response.body);
      } else {
        return Future.error('Failed to load jobs from API');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Job> getOne(int id) async {
    try {
      http.Response response = await getFromEndpoint("$jobsAPIEndpoint/$id");
      if (response.statusCode == 200) {
        return Job.fromJson(response.body);
      } else {
        return Future.error('Failed to load job from API');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Job> insert(Job value) async {
    try {
      http.Response response =
          await postToEndpoint(jobsAPIEndpoint, value.toMap());
      Map<String, dynamic> json = jsonDecode(response.body);
      return Job.fromJson(json["data"]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> delete(Job value) async {
    await deleteFromEndpoint("$jobsAPIEndpoint/${value.id}");
  }
}
