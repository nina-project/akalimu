import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify")),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: const Text(
                "Verify Email",
                style: TextStyle(backgroundColor: Colors.teal),
              ))
        ],
      ),
    );
  }
}
