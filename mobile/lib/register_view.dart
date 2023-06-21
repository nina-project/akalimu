import 'dart:developer';

import 'package:akalimu/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:akalimu/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
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
                child: Text('Sign Up',
                style: TextStyle(fontSize: 16,
  ).copyWith(
    fontWeight: FontWeight.bold,
  ),
                ),
              ),
              
            ]),
             SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
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
             SizedBox(height: 20.0),
            TextField(
              decoration:  InputDecoration(
                labelText: "Email address",
               border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
             
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration:
                   InputDecoration(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [  
                SizedBox(height: 40.0,),
              Expanded(
                child: Text('Forgot Password?',
                textAlign: TextAlign.right,
                ),
                
              ),
             
              
            ]),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email.text, password: _password.text);
                } on FirebaseAuthException catch (e) {
                  log(e.code);
                }
              },
              child: Text("Sign Up"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                minimumSize: Size(150, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                backgroundColor: Color(0xFF163a96),
              ),
            ),
            SizedBox(height: 30.0,),
            
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(verifyRoute);
            //     },
            //     child: const Text("verify")),
            ElevatedButton(
                onPressed: () {
                  AuthService().signInWithGoogle();
                  Navigator.of(context).pushNamed(mainPageRoute);
                },
                child: const Text("Continue with Google"),
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                minimumSize: Size(200, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                backgroundColor: Color(0xFF163a96),
              ),
                ),
                SizedBox(height: 20.0, width: 20.0,),
                TextButton(onPressed: () {

                }, 
                child: Text('By clicking Sign Up or Continue with Google, you agree with our Terms and Conditions and Privacy Policy',
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
