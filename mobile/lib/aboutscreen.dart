import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      backgroundColor: Colors.white30,
      body: ListView(
        children: [
          Container(
            width: 100.0,
            height: 150.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: const Image(
              image: AssetImage('assets/gighub.png'),
            ),
          ),
          const Text(
            "KNOW MORE ABOUT US:",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              height: 8,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/eee.png',
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {}, //_launchURL,
                      child: const Text(
                        'Website',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          height: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/github.png',
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {}, //_launchGit,
                      child: const Text(
                        'GitHub',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          height: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Column(
              //     children: <Widget>[
              //       Image.asset(
              //         'assets/githu.png',
              //         height: 100,
              //       ),
              //       TextButton(
              //         onPressed: _launchGit,
              //         child: Text(
              //           'Github',
              //           style: TextStyle(
              //             color: Colors.teal,
              //             fontSize: 18.0,
              //             fontWeight: FontWeight.normal,
              //             height: 6,
              //         ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),

          // child: TextButton(
          //     onPressed: () {
          //       InkWell(
          //           child: new Text('WEBSITE'),
          //            onTap: () =>
          //                launch('https://mene11.github.io/index.html'));

          //     },
          //     child: Text("Website"
          //      ),
          //    ),

          // Image.asset('assets/image-s.jpg',
          // height: 100,
          // ),
        ],
      ),
    );
  }
}

// _launchURL() async {
//   const url = 'https://mene11.github.io/index.html';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'could not launch $url';
//   }
// }

// _launchGit() async {
//   const url = 'https://github.com/BBOSA-VINCENT/gighub/tree/master';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'could not launch $url';
//   }
// }