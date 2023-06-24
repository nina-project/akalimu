import 'package:akalimu/screens/main/mainappscreen.dart';
import 'package:flutter/material.dart';

import 'maindrawerscreen.dart';
//import 'routes.dart';

class MainUi extends StatefulWidget {
  const MainUi({super.key});

  @override
  State<MainUi> createState() => _MainUiState();
}

enum MenuAction { logout }

class _MainUiState extends State<MainUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MainUI"),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              await showDialogBox(context);
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text("logout"),
                ),
              ];
            },
          )
        ],
      ),
      body: const MainPage(),
    );
  }
}

// Future<bool> showDialogBox(context) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Logout"),
//           content: const Text("Do you want to logout"),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   FirebaseAuth.instance.signOut();
//                   Navigator.of(context)
//                       .pushNamedAndRemoveUntil("/login/", (route) => false);
//                   log("true");
//                 },
//                 child: const Text("Yes")),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(false);
//                   log('false');
//                 },
//                 child: const Text("No"))
//           ],
//         );
//       }).then((value) => value ?? false);
// }
