import 'package:akalimu/helpscreen.dart';
import 'package:akalimu/screens/commended/all_clients_screen.dart';
import 'package:flutter/material.dart';

import 'screens/auth/login_view_screen.dart';
import 'screens/auth/register_view.dart';
import 'screens/commended/client_screen.dart';
import 'screens/jobs/all_jobs_view.dart';
import 'screens/jobs/job_details_screen.dart';
import 'screens/main/home_page_route_screen.dart';
import 'screens/main/mainappscreen.dart';
import 'verify_email_view.dart';

const loginRoute = '/login/';
const registerRoute = '/register/';
const verifyRoute = '/verify/';
const mainPageRoute = '/mainpage/';
const homePageRoute = '/homepage/';

Map<String, Widget Function(BuildContext)> routes = {
  loginRoute: (context) => const LoginPage(),
  registerRoute: (context) => const RegisterPage(),
  verifyRoute: (context) => const VerifyEmail(),
  mainPageRoute: (context) => const MainPage(),
  homePageRoute: (context) => const HomePageRoute(),
  AllJobsView.routeName: (context) => const AllJobsView(),
  AllClientsScreen.routeName: (context) => const AllClientsScreen(),
  JobDetailsScreen.routeName: (context) => const JobDetailsScreen(),
  ClientScreen.routeName: (context) => const ClientScreen(),
  Help.routeName: (context) => const Help(),
};
