import 'package:akalimu/data/api/auth_api.dart';
import 'package:akalimu/data/api/jobs_api.dart';
import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/models/job.dart';
import 'package:akalimu/data/query_params.dart';
import 'package:flutter/material.dart';

import '../models/user_data.dart';

class AppProvider extends ChangeNotifier {
  UserData? _userData;
  UserData? get userData => _userData;

  List<Job> _jobs = [];
  List<Job> get jobs => _jobs;

  Job? _selectedJob;
  Job? get selectedJob => _selectedJob;

  int offset = 0;
  int limit = 20;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  final AuthAPI _authAPI = AuthAPI();
  final JobsAPI _jobsAPI = JobsAPI();
  final LocalPreferences _localPreferences = LocalPreferences();

  Future<UserData> registerUser(UserData userData) async {
    _isLoading = true;
    notifyListeners();
    final UserData createdUser = await _authAPI.register(userData);
    _userData = createdUser;
    _localPreferences.setUserData(createdUser);
    _isLoading = false;
    notifyListeners();
    return createdUser;
  }

  Future<UserData?> loginUser(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    final String? token =
        await _authAPI.login(email: email, password: password);
    UserData? _data;
    if (token != null) {
      // _userData = await _authAPI.getUserData(email);
      _userData = UserData(
          name: "No Name",
          email: email,
          password: password,
          accessToken: token);
      _data = _userData;
      _localPreferences.setUserData(_userData);
      _isLoading = false;
    }
    notifyListeners();
    return _data;
  }

  init() async {
    fetchAllJobs();
  }

  Future fetchAllJobs() async {
    _isLoading = true;
    notifyListeners();
    try {
      _jobs = await _jobsAPI
          .getAll(JobsQueryParams(filter: JobsQueryParams.filterAll));
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<Job> createJob(Job job) async {
    _isLoading = true;
    notifyListeners();
    final Job createdJob = await _jobsAPI.insert(job);
    _jobs.add(createdJob);
    _isLoading = false;
    notifyListeners();
    return createdJob;
  }

  Future<bool> signOutUser() async {
    _isLoading = true;
    notifyListeners();
    _userData = null;
    bool signedOut = await _localPreferences.setUserData(null);
    _isLoading = false;
    notifyListeners();
    return signedOut;
  }
}
