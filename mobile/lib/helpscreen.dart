import 'package:flutter/material.dart';
import 'package:akalimu/screens/main/maindrawerscreen.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Help'),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainDrawer(
                            userImage: '',
                          )),
                );
              },
            )),
        body: Column(children: [
          const SizedBox(height: 10),
          const Text(
            'WE LOVE TO HELP',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                primary: const Color.fromARGB(176, 255, 255, 255),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 40, 0)),
                    Center(
                      child: Text(
                        'Call Help Line',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                backgroundColor: const Color.fromARGB(176, 255, 255, 255),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  const Icon(
                    Icons.report_problem_outlined,
                    color: Colors.black,
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(10, 0, 40, 0)),
                  const Center(
                    child: Text(
                      'Report a Problem',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ]),
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                backgroundColor: const Color.fromARGB(176, 255, 255, 255),
              ),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(children: const [
                  Icon(Icons.message_outlined, color: Colors.black),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 40, 0)),
                  Center(
                    child: Text(
                      'Send Feedback',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
