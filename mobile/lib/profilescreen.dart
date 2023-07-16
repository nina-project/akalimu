//REQUIRED

//import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
//import 'dart:html';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import 'data/local_preferences.dart';
import 'data/models/category.dart';
import 'data/models/client.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  List<Category> categoryValues = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      await appProvider.fetchCategories();
      setState(() {
        _phoneController.text = appProvider.userData?.phoneNumber ?? '';
        _nameController.text = appProvider.userData?.name ?? '';
        _cityController.text = appProvider.userData?.city ?? '';
        _countryController.text = appProvider.userData?.country ?? '';
        categoryValues = appProvider.userData?.interests ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        child: Consumer<AppProvider>(builder: (context, appProvider, _) {
          return Column(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    painter: HeaderCurvedContainer(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4.6,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 4,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 5),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  // image: const DecorationImage(
                                  //   fit: BoxFit.cover,
                                  //   image: AssetImage('assets/logo.png'),
                                  // ),
                                ),
                                child: const Icon(
                                  Icons.person_2,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                              ),
                              // Positioned(
                              //   right: 0,
                              //   child: CircleAvatar(
                              //     backgroundColor: Colors.black,
                              //     child: IconButton(
                              //       icon: const Icon(
                              //         Icons.edit,
                              //         color: Colors.white,
                              //       ),
                              //       onPressed: () {
                              //         _pickImageFromGallery;
                              //       },
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 15),
                              Text(
                                (appProvider.userData?.email).toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Enter phone number',
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.phone),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF163a96)),
                          ),
                        ),
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Please enter your phone number';
                          // }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter name',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF163a96)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Country',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _countryController,
                        decoration: const InputDecoration(
                          hintText: 'Enter country of residence',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF163a96)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter country';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'City',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          hintText: 'Enter city where you are located',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF163a96)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter city';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Interests',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      MultiSelectDialogField<Category>(
                        title: const Text(
                          'Interests',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        initialValue: categoryValues,
                        listType: MultiSelectListType.CHIP,
                        items: appProvider.categories
                            .map((e) => MultiSelectItem<Category>(e, e.name))
                            .toList(),
                        onConfirm: (values) {
                          setState(() {
                            categoryValues = values;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select at least one of your interests';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40.0),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFF163a96), // Text Color background color)
                          ),
                          onPressed: () {
                            updateProfile();
                          },
                          child: const Text('Update Details'),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  updateProfile() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      Client currentUserData =
          appProvider.userData ?? LocalPreferences().userData!;
      Client userData = currentUserData.copyWith(
        phoneNumber: _phoneController.text,
        name: _nameController.text,
        country: _countryController.text,
        city: _cityController.text,
        interests: categoryValues,
        updatedAt: DateTime.now(),
      );

      appProvider.updateUserData(userData).then((value) {
        Navigator.of(context).pop();
      });
    }
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
