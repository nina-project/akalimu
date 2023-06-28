import 'dart:developer';

import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/models/user_data.dart';
//import 'package:akalimu/login_view_screen.dart';
//import 'package:akalimu/main_ui_controller.dart';
import 'package:akalimu/screens/auth/register_view.dart';
import 'package:flutter/material.dart';

import 'mainappscreen.dart';

class HomePageRoute extends StatelessWidget {
  const HomePageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final UserData? userData = LocalPreferences().userData;
    if (userData != null) {
      log(userData.toString());
      return const MainPage();
    } else {
      return const RegisterPage();
    }
  }
}
