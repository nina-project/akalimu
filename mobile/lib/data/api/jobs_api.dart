import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/job.dart';
import '../query_params.dart';
import 'api.dart';

class JobsAPI {
  final String jobsAPIEndpoint = "$baseAPIUrl/jobs";
  final String categoriesAPIEndpoint = "$baseAPIUrl/categories";

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
        Map<String, dynamic> map = jsonDecode(response.body);
        return Job.fromMap(map['data']);
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
      return Job.fromMap(json["data"]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> delete(Job value) async {
    await deleteFromEndpoint("$jobsAPIEndpoint/${value.id}");
  }

  Future<List<Category>> fetchCategories() async {
    try {
      http.Response response = await getFromEndpoint(categoriesAPIEndpoint);
      if (response.statusCode == 200) {
        String source = response.body;
        final jsonResponse = json.decode(source);
        final List<dynamic> categoriesList =
            jsonResponse['data'] as List<dynamic>;
        return categoriesList.map((categoryMap) {
          return Category.fromMap(categoryMap as Map<String, dynamic>);
        }).toList();
      } else {
        return Future.error('Failed to load categories from API');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
