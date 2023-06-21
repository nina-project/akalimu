import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              CircleAvatar(
  backgroundImage: AssetImage('assets/logo.png'),
  radius: 50,
),

              // Image.asset(
              //   'assets/logo.png',
              //   height: 56,
              //   width: 83,
              //   alignment: Alignment.center,
              // )
            ],
          ),
          Text(
            'Akalimu',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Lucida',
              fontWeight: FontWeight.bold,
            ),
            //   textAlign: TextAlign.center,
          ),
          Divider(
            color: Colors.transparent,
          ),
          SizedBox(height: 10),
          Text(
            'Become a Tasker or Poster by signing up!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 100),
          const ElevatedButton(
            onPressed: null,
            child: Text(
              'Get Started',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xFF163a96)),
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Have an account? Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
