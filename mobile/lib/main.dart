//import 'package:akalimu/recommendationscreen.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:akalimu/accountscreen.dart';
//import 'package:akalimu/categoryscreen.dart';
//import 'package:akalimu/futurebuilderdemo.dart';
import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/providers/app_provider.dart';
//import 'package:akalimu/maps.dart';
//import 'package:akalimu/posttaskscreen.dart';
//import 'package:akalimu/prac.dart';
import 'package:akalimu/screens/auth/register_view.dart';
import 'package:akalimu/screens/clients/client_screen.dart';
import 'package:akalimu/screens/jobs/job_details_screen.dart';
//import 'package:akalimu/jobrequirementscreen.dart';
import 'package:akalimu/screens/main/main_ui_controller.dart';
import 'package:akalimu/screens/main/mainappscreen.dart';
//.import 'package:akalimu/taskscreen.dart';
import 'package:akalimu/verify_email_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'screens/auth/login_view_screen.dart';
import 'screens/main/home_page_route_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalPreferences().init();

  //WidgetsFlutterBinding.ensureInitialized();
  //Firebase.initializeApp();
  // runApp(const HelloRectangle());
  // ignore: prefer_const_constructors
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePageRoute(),
        builder: (_, home) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => AppProvider(),
                  lazy: false,
                ),
              ],
              child: home,
            ),
        routes: {
          loginRoute: (context) => const LoginPage(),
          registerRoute: (context) => const RegisterPage(),
          verifyRoute: (context) => const VerifyEmail(),
          mainUiRoute: (context) => const MainUi(),
          mainPageRoute: (context) => const MainPage(),
          homePageRoute: (context) => const HomePageRoute(),
          JobDetailsScreen.routeName: (context) => const JobDetailsScreen(),
          ClientScreen.routeName: (context) => const ClientScreen(),
        }),
  );
}


// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// void main() {
//   runApp(const MaterialApp(home: MainUi()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late bool _serviceEnabled;
//   late PermissionStatus _permissionGranted;
//   LocationData? _userLocation;

//   Future<void> _getUserLocation() async {
//     Location location = Location();

//     // Check if location service is enable
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     // Check if permission is granted
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     final _locationData = await location.getLocation();
//     setState(() {
//       _userLocation = _locationData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: _getUserLocation,
//                 child: const Text('Check Location')),
//             const SizedBox(height: 25),
//             // Display latitude & longtitude
//             _userLocation != null
//                 ? Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Wrap(
//                       children: [
//                         Text('Your latitude: ${_userLocation?.latitude}'),
//                         const SizedBox(width: 10),
//                         Text('Your longtitude: ${_userLocation?.longitude}')
//                       ],
//                     ),
//                   )
//                 : Container()
//           ],
//         ),
//       ),
//     );
//   }
// }
