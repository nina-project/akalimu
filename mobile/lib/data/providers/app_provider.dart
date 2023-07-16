import 'package:akalimu/data/api/auth_api.dart';
import 'package:akalimu/data/api/jobs_api.dart';
import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/models/auth_object.dart';
import 'package:akalimu/data/models/client.dart';
import 'package:akalimu/data/models/job.dart';
import 'package:akalimu/data/query_params.dart';
import 'package:flutter/material.dart';

import '../api/clients_api.dart';
import '../models/category.dart';

class AppProvider extends ChangeNotifier {
  Client? _userData;
  Client? get userData => _userData;

  List<Job> _jobs = [];
  List<Job> get jobs => _jobs;
  List<Job> _userJobs = [];
  List<Job> get userJobs => _userJobs;
  List<Job> _recommendedJobs = [];
  List<Job> get recommendedJobs => _recommendedJobs;
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  List<Client> _clients = [];
  List<Client> get clients => _clients;
  List<Client> _recommendedClients = [];
  List<Client> get recommendedClients => _recommendedClients;

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

  Future<void> registerUser(AuthObject userData) async {
    _isLoading = true;
    notifyListeners();
    final AuthObject? authObject = await _authAPI.register(userData);
    if (authObject?.accessToken != null) {
      Client tempUser = Client(
        id: 0,
        name: authObject!.name!,
        email: authObject.email!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      _userData = tempUser;
      await _localPreferences.setUserToken(authObject.accessToken!);
      await _localPreferences.setUserPassword(authObject.password!);
      await _localPreferences.setUserData(tempUser);
      //after setting the dummy user object, get the actual user data from the db.
      await fetchAndUpdateUserData();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginUser(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    final AuthObject? authObject =
        await _authAPI.login(email: email, password: password);
    if (authObject?.accessToken != null) {
      //after getting token, temporarily set a dummy userObject.
      //store token and password in local preferences.
      _userData = Client(
        id: 0,
        name: "No Name",
        email: email,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await _localPreferences.setUserToken(authObject!.accessToken!);
      await _localPreferences.setUserPassword(password);
      await _localPreferences.setUserData(_userData);
      //after setting the dummy user object, get the actual user data from the db.
      await fetchAndUpdateUserData();
    }
    _isLoading = false;
    notifyListeners();
  }

  init() async {
    fetchRecommendedJobs();
    fetchUserJobs();
    fetchAllJobs();
    fetchAndUpdateUserData();
  }

  Future<void> fetchAndUpdateUserData() async {
    //updates the local and provider userData with the latest from the db.
    _isLoading = true;
    notifyListeners();
    Client? currentUserData = _localPreferences.userData;

    final Client? userDataFromDB =
        await _authAPI.getUserData(currentUserData?.email ?? _userData?.email);
    if (userDataFromDB != null) {
      _userData = userDataFromDB;
      _localPreferences.setUserData(userDataFromDB);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future fetchRecommendedJobs() async {
    _isLoading = true;
    notifyListeners();
    try {
      _recommendedJobs = await _jobsAPI
          .getRecommended(JobsQueryParams(filter: JobsQueryParams.filterAll));
    } catch (e) {
      _error = e.toString();
      print("Error getting recommended jobs$e");
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
      debugPrint(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  Future fetchUserJobs({int? id}) async {
    _isLoading = true;
    notifyListeners();
    try {
      int? userId;
      if (id != null) {
        userId = id;
      } else {
        userId = _userData?.id ?? _localPreferences.userData?.id;
      }

      _userJobs = await _jobsAPI.getUserJobs(userId!);
    } catch (e) {
      _error = e.toString();
      debugPrint(e.toString());
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

  Future deleteJob(Job job) async {
    _isLoading = true;
    notifyListeners();
    await _jobsAPI.delete(job);
    _jobs.removeWhere((j) => j.id == job.id);
    _userJobs.removeWhere((j) => j.id == job.id);
    _isLoading = false;
    notifyListeners();
  }

  Future fetchAllClients() async {
    _isLoading = true;
    notifyListeners();
    try {
      _clients = await _clientsAPI
          .getAll(ClientsQueryParams(filter: ClientsQueryParams.filterAll));
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future fetchRecommendedClientsForJob(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _recommendedClients = await _jobsAPI.getRecommendedClientsForJob(
          id, ClientsQueryParams(filter: ClientsQueryParams.filterAll));
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

  Future<Client> createClient(Client client) async {
    _isLoading = true;
    notifyListeners();
    final Client createdWorker = await _clientsAPI.insert(client);
    _clients.add(createdWorker);
    _isLoading = false;
    notifyListeners();
    return createdWorker;
  }

  Future<Client> updateUserData(Client client) async {
    _isLoading = true;
    notifyListeners();
    final Client updatedClient = await _clientsAPI.updateUserProfile(client);
    _userData = updatedClient;
    await _localPreferences.setUserData(updatedClient);
    _isLoading = false;
    notifyListeners();
    return updatedClient;
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
