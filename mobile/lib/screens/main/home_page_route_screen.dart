import 'dart:developer';

import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/models/category.dart';
import 'package:akalimu/data/models/client.dart';
import 'package:akalimu/screens/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/app_provider.dart';
import 'additional_details.dart';
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
      final appProvider = Provider.of<AppProvider>(context, listen: false);

      String? city = appProvider.userData?.city ?? userData.city;
      List<Category> interests =
          appProvider.userData?.interests ?? userData.interests;
      if (city == null || interests.isEmpty) {
        return const AdditionalDetails();
      }
      return const MainPage();
    } else {
      return const RegisterPage();
    }
  }
}
