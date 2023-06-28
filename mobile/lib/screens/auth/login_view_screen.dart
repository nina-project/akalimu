// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   late TextEditingController _email;
//   late TextEditingController _password;

//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter your email",
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             const TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter your password",
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     await FirebaseAuth.instance.signInWithEmailAndPassword(
//                         email: _email.text, password: _password.text);
//                     Navigator.of(context).pushNamedAndRemoveUntil(
//                       "/mainpage/",
//                       (route) => false,
//                     );
//                   } on FirebaseAuthException catch (e) {
//                     log(e.code.toString());
//                   }
//                 },
//                 child: const Text("Login"),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:akalimu/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/app_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute, (route) => false);
                  },
                  child: const Text("Have no account? Sign Up"),
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
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // try {
                  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
                  //     email: _emailController.text,
                  //     password: _passwordController.text,
                  //   );
                  //   Navigator.of(context).pushNamedAndRemoveUntil(
                  //     "/mainpage/",
                  //     (route) => false,
                  //   );
                  // } on FirebaseAuthException catch (e) {
                  //   log(e.code.toString());
                  // }
                  try {
                    AppProvider appProvider =
                        Provider.of<AppProvider>(context, listen: false);
                    await appProvider
                        .loginUser(
                            _emailController.text, _passwordController.text)
                        .then((_) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          homePageRoute, (route) => false);
                    });
                  } catch (e) {
                    log(e.toString());
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  minimumSize: const Size(500, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color(0xFF163a96),
                ),
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
