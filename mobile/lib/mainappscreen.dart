//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:akalimu/recommendationscreen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:akalimu/posttaskscreen.dart';
import 'package:akalimu/taskscreen.dart';

import 'maindrawerscreen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // User? uid = FirebaseAuth.instance.currentUser;
    // String id = uid!.uid;
    ThemeData theme = ThemeData();
    theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(primary: const Color(0xFF163a96)),
    );
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          // resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: const Color(0xFF163a96),
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Tasks',
                  icon: Icon(
                    Icons.post_add_outlined,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  text: 'commended',
                  icon: Icon(
                    Icons.people_outline,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  text: 'Post Task',
                  icon: Icon(
                    Icons.view_agenda_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          drawer: const MainDrawer(
            userImage: '',
          ),
          body: const TabBarView(
            children: [
              TaskPage(),
              RecommendationCardListView(),
              PostTaskPage(),
            ],
          ),
        ));
  }
}
