import 'dart:developer';

import 'package:akalimu/data/models/user_data.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:akalimu/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  },
                  child: const Text("Have an account? Sign in"),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                child: Text(
                  'Sign Up',
                  style: const TextStyle(
                    fontSize: 16,
                  ).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _firstName,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _lastName,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              obscureText: true,
              // autocorrect: false,
              // enableSuggestions: false,
              controller: _password,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.right,
                ),
              ),
            ]),
            ElevatedButton(
              onPressed: () async {
                // try {
                //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
                //       email: _email.text, password: _password.text);
                // } on FirebaseAuthException catch (e) {
                //   log(e.code);
                // }
                try {
                  String fullName = "${_firstName.text} ${_lastName.text}";
                  UserData userData = UserData(
                    name: fullName,
                    email: _email.text,
                    password: _password.text,
                  );
                  AppProvider appProvider =
                      Provider.of<AppProvider>(context, listen: false);
                  await appProvider.registerUser(userData).then((createdUser) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        homePageRoute, (route) => false);
                  });
                } catch (e) {
                  log(e.toString());
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                minimumSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: const Color(0xFF163a96),
              ),
              child: const Text("Sign Up"),
            ),
            const SizedBox(
              height: 30.0,
            ),

            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(verifyRoute);
            //     },
            //     child: const Text("verify")),
            // ElevatedButton(
            //   onPressed: () {
            //     AuthService().signInWithGoogle();
            //     Navigator.of(context).pushNamed(mainPageRoute);
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            //     minimumSize: const Size(200, 40),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20.0),
            //     ),
            //     backgroundColor: const Color(0xFF163a96),
            //   ),
            //   child: const Text("Continue with Google"),
            // ),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'By clicking Sign Up or Continue with Google, you agree with our Terms and Conditions and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
