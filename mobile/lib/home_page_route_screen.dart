import 'dart:developer';

import 'package:akalimu/mainappscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:akalimu/login_view_screen.dart';
//import 'package:akalimu/main_ui_controller.dart';
import 'package:akalimu/register_view.dart';
import 'firebase_options.dart';

class HomePageRoute extends StatelessWidget {
  const HomePageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                log(user.toString());
                return const MainPage();
              } else {
                log(user.toString());
                return const RegisterPage();
              }
            default:
              const Text('Done');
          }
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        });
  }
}
