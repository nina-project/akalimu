import 'package:akalimu/data/api/auth_api.dart';
import 'package:akalimu/data/api/jobs_api.dart';
import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/models/client.dart';
import 'package:akalimu/data/models/job.dart';
import 'package:akalimu/data/query_params.dart';
import 'package:flutter/material.dart';

import '../api/clients_api.dart';
import '../models/category.dart';
import '../models/user_data.dart';

class AppProvider extends ChangeNotifier {
  UserData? _userData;
  UserData? get userData => _userData;

  List<Job> _jobs = [];
  List<Job> get jobs => _jobs;
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  List<Client> _workers = [];
  List<Client> get workers => _workers;

  Job? _selectedJob;
  Job? get selectedJob => _selectedJob;

  Client? _selectedClient;
  Client? get selectedClient => _selectedClient;

  int offset = 0;
  int limit = 20;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  final AuthAPI _authAPI = AuthAPI();
  final JobsAPI _jobsAPI = JobsAPI();
  final ClientsAPI _clientsAPI = ClientsAPI();
  final LocalPreferences _localPreferences = LocalPreferences();

  Future<void> registerUser(UserData userData) async {
    _isLoading = true;
    notifyListeners();
    final UserData createdUser = await _authAPI.register(userData);
    _userData = createdUser;
    _localPreferences.setUserData(createdUser);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginUser(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    final String? token =
        await _authAPI.login(email: email, password: password);
    if (token != null) {
      //after getting token, temporarily set a dummy userObject with token.
      //this is to ensure the getUserData api query works since it requires a bearer token.
      _userData = UserData(
          name: "No Name",
          email: email,
          password: password,
          accessToken: token);
      await _localPreferences.setUserData(_userData);
      //after setting the dummy user object, get the actual user data from the db.
      await updateUserData();
    }
    _isLoading = false;
    notifyListeners();
  }

  init() async {
    fetchAllJobs();
    fetchAllClients();
    updateUserData();
  }

  Future<void> updateUserData() async {
    //updates the local and provider userData with the latest from the db.
    _isLoading = true;
    notifyListeners();
    UserData? currentUserData = _localPreferences.userData;

    final UserData? userDataFromDB =
        await _authAPI.getUserData(currentUserData?.email ?? _userData?.email);
    if (userDataFromDB != null) {
      // create a new userData object and append the bearer token and password to the user data object from db and update the provider and locally stored instance.
      UserData updatedUserFromDB = userDataFromDB.copyWith(
          token: currentUserData?.accessToken,
          password: currentUserData?.password);
      _userData = updatedUserFromDB;
      _localPreferences.setUserData(updatedUserFromDB);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future fetchAllJobs() async {
    _isLoading = true;
    notifyListeners();
    try {
      _jobs = await _jobsAPI
          .getAll(JobsQueryParams(filter: JobsQueryParams.filterAll));
    } catch (e) {
      _error = e.toString();
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await _jobsAPI.fetchCategories();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<Job> findJobById(int id) async {
    _isLoading = true;
    notifyListeners();
    final Job job = await _jobsAPI.getOne(id);
    _selectedJob = job;
    _isLoading = false;
    notifyListeners();
    return job;
  }

  Future<Job> createJob(Job job) async {
    _isLoading = true;
    notifyListeners();
    final Job createdJob = await _jobsAPI.insert(job);
    _jobs.add(createdJob);
    _selectedJob = createdJob;
    _isLoading = false;
    notifyListeners();
    return createdJob;
  }

  Future fetchAllClients() async {
    _isLoading = true;
    notifyListeners();
    try {
      _workers = await _clientsAPI
          .getAll(ClientsQueryParams(filter: ClientsQueryParams.filterAll));
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<Client> findClientById(int id) async {
    _isLoading = true;
    notifyListeners();
    final Client client = await _clientsAPI.getOne(id);
    _selectedClient = client;
    _isLoading = false;
    notifyListeners();
    return client;
  }

  Future<Client> createClient(Client worker) async {
    _isLoading = true;
    notifyListeners();
    final Client createdWorker = await _clientsAPI.insert(worker);
    _workers.add(createdWorker);
    _isLoading = false;
    notifyListeners();
    return createdWorker;
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
