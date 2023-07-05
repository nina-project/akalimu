import 'dart:developer';

import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/models/client.dart';
import 'package:akalimu/screens/auth/register_view.dart';
import 'package:flutter/material.dart';

import 'mainappscreen.dart';

class HomePageRoute extends StatelessWidget {
  const HomePageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final Client? userData = LocalPreferences().userData;
    if (userData != null) {
      // log(userData.toString());
      log("Token:\n");
      log(LocalPreferences().userToken);

      // String? city =
      //     Provider.of<AppProvider>(context, listen: false).userData?.city;
      // if (city == null) {
      //   return const AdditionalDetails();
      // }
      return const MainPage();
    } else {
      return const RegisterPage();
    }
  }
}
