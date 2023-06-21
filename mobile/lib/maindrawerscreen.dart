import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:akalimu/main_ui_controller.dart';
//import 'package:gighub/auth_service.dart';
//import 'package:gighub/profile_user.dart';
//import 'package:provider/provider.dart';
import 'package:akalimu/payments_screen.dart';
import 'package:akalimu/profilescreen.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

import 'aboutscreen.dart';
import 'helpscreen.dart';

class MainDrawer extends StatefulWidget {
  final String userImage;

  const MainDrawer({super.key, required this.userImage});
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  String? _ref;
  String amount = '10000';
  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);

    if (Platform.isAndroid) {
      setState(() {
        _ref = "AndroidRef1789$number";
      });
    } else {
      setState(() {
        _ref = "IOSRef1789$number";
      });
    }
  }

  @override
  void initState() {
    setRef();
    super.initState();
  }

  // static const IconData verified =
  //     IconData(0xe699, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<DocumentSnapshot>(
      stream: users.doc(user!.uid).snapshots(),
      builder: (ctx, streamSnapshot) {
        return Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: const Color(0xFF163a96),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: CircleAvatar(
                          radius: 40.0,
                          child: ClipOval(
                            child: Image.network(
                              (user?.photoURL).toString(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Row(children: [
                          Text(
                            (user?.displayName).toString(),
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          // Text(streamSnapshot.data!['lastname'],
                          //     style: const TextStyle(fontSize: 22)),
                          IconButton(
                            onPressed: () {},
                            icon: new Icon(Icons.verified),
                            color: Colors.white,
                            //highlightColor: Colors.white,
                          ),
                        ]),
                      ),
                      // Text(
                      //   (user?.phoneNumber).toString(),
                      //   style: const TextStyle(
                      //     fontSize: 18,
                      //     color: Color(0xFF163a96),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF163a96),
                ),
                title: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: const Text('Profile',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.payment, color: Color(0xFF163a96)),
                title: TextButton(
                  onPressed: () {
                    _makePayment(context, ((user?.email).toString()).trim(),
                        amount.trim());
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const Payments()));
                  },
                  child: const Text('Payments',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading:
                    const Icon(Icons.help_outline, color: Color(0xFF163a96)),
                title: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Help()));
                  },
                  child: const Text('Help',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading:
                    const Icon(Icons.info_outline, color: Color(0xFF163a96)),
                title: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const About()));
                  },
                  child: const Text('About',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading:
                    const Icon(Icons.logout_outlined, color: Color(0xFF163a96)),
                title: TextButton(
                  onPressed: () async {
                    await showDialogBox(context);
                  },
                  child: const Text('Logout',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _makePayment(BuildContext context, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST4734027149f5",
          publicKey: "FLWPUBK_TEST-e8d4cd5462fb381c4163ba7f7f746a98-X",
          currency: "NGN",
          amount: amount,
          email: (user?.email).toString(),
          fullName: (user?.displayName).toString(),
          txRef: _ref!,
          isDebugMode: true,
          phoneNumber: "0123456789",
          acceptCardPayment: true,
          acceptUSSDPayment: true,
          acceptAccountPayment: true,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: true,
          acceptZambiaPayment: false);

      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();

      if (response == null) {
        print("Transaction Failed");
      } else {
        ///
        if (response.status == "success") {
          print(response.data);
          print(response.message);
        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }
}

Future<bool> showDialogBox(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Do you want to logout"),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/homepage/", (route) => false);
                print("true");
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Color(0xFF163a96),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                print('false');
              },
              child: const Text(
                "No",
                style: TextStyle(
                  color: Color(0xFF163a96),
                ),
              ),
            )
          ],
        );
      }).then((value) => value ?? false);
}
