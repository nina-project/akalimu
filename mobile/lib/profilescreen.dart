//REQUIRED

//import 'package:provider/provider.dart';
import 'package:akalimu/screens/main/mainappscreen.dart';
import 'package:flutter/material.dart';
//import 'dart:html';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'data/providers/app_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? user = FirebaseAuth.instance.currentUser;
  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AppProvider>(builder: (context, appProvider, _) {
      if (appProvider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF163a96),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.5,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color(0xFF163a96),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MainPage()));
              }),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        (appProvider.userData?.name).toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text((appProvider.userData?.email).toString(),
                          style: const TextStyle(fontSize: 20)),
                      Text((appProvider.userData?.phoneNumber).toString(),
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(
                        height: 55,
                        width: double.infinity,
                      )
                    ],
                  ),
                )
              ],
            ),
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    " ",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 270, left: 184),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _pickImageFromGallery;
                  },
                ),
              ),
            )
          ],
        ),
      );
    }));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFF163a96);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Future<void> _pickImageFromGallery() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    // Use the picked image
    // You can display it in an Image widget or perform further processing
    //final imageFile = File(pickedImage.path);
    // Do something with the image file
  } else {
    // User canceled the picker
  }
}
