// import 'package:flutter/material.dart';

// enum TimeSlot { morning, afternoon, evening, midMorning }

// class JobRequirementPage extends StatefulWidget {
//   const JobRequirementPage({super.key});

//   @override
//   State<JobRequirementPage> createState() => _JobRequirementPageState();
// }

// class _JobRequirementPageState extends State<JobRequirementPage> {
//   TimeSlot? selectedTimeSlot;
//   bool isRemote = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             backgroundColor: const Color(0xFFEEEBEB),
//             resizeToAvoidBottomInset: true,
//             appBar: AppBar(
//               backgroundColor: const Color(0xFFEEEBEB),
//               leading: IconButton(
//                 color: Colors.black,
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {
//                   // Handle back arrow button press
//                 },
//               ),
//               title: const Text(
//                 "Post Task",
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Container(
//                 color: const Color(0xFFEEEBEB),
//                 child: Center(
//                   child: Card(
//                     color: Colors.white,
//                     margin: const EdgeInsets.all(20.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Any Requirements or tools needed?',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10.0),
//                           TextFormField(
//                             decoration: const InputDecoration(
//                               //hintText: 'Requirements or tools',
//                               border: OutlineInputBorder(),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 3.0, color: Color(0xFF163a96)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20.0),
//                           const Text(
//                             'When do you need it to be done?',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10.0),
//                           TextFormField(
//                               decoration: const InputDecoration(
//                             //hintText: 'Enter description',
//                             border: OutlineInputBorder(),
//                             suffixIcon: Icon(Icons.calendar_today_outlined),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Color(0xFF163a96)),
//                             ),
//                           )),
//                           const SizedBox(height: 20.0),
//                           const Text(
//                             'Time of the task',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10.0),
//                           GridView.count(
//                             crossAxisCount: 2,
//                             shrinkWrap: true,
//                             children: [
//                               RadioListTile<TimeSlot>(
//                                 title: const Text('Morning'),
//                                 value: TimeSlot.morning,
//                                 groupValue: selectedTimeSlot,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedTimeSlot = value!;
//                                   });
//                                 },
//                               ),
//                               RadioListTile<TimeSlot>(
//                                 title: const Text('Afternoon'),
//                                 value: TimeSlot.afternoon,
//                                 groupValue: selectedTimeSlot,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedTimeSlot = value!;
//                                   });
//                                 },
//                               ),
//                               RadioListTile<TimeSlot>(
//                                 title: const Text('Evening'),
//                                 value: TimeSlot.evening,
//                                 groupValue: selectedTimeSlot,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedTimeSlot = value!;
//                                   });
//                                 },
//                               ),
//                               RadioListTile<TimeSlot>(
//                                 title: const Text('Mid-Morning'),
//                                 value: TimeSlot.midMorning,
//                                 groupValue: selectedTimeSlot,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedTimeSlot = value!;
//                                   });
//                                 },
//                               ),
//                               //const SizedBox(height: 20.0),
//                             ],
//                           ),
//                           const Text(
//                             'Your estimated wage',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextFormField(
//                             decoration: const InputDecoration(
//                               //hintText: 'Requirements or tools',
//                               border: OutlineInputBorder(),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 3.0, color: Color(0xFF163a96)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20.0),
//                           Align(
//                             alignment: Alignment.center,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(
//                                     0xFF163a96), // Text Color background color)
//                               ),
//                               onPressed: () {
//                                 // Handle continue button press
//                               },
//                               child: const Text('Continue'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )));
//   }
// }

// import 'package:flutter/material.dart';

// enum TimeSlot { morning, afternoon, evening, midMorning }

// class JobRequirementPage extends StatefulWidget {
//   const JobRequirementPage({super.key});

//   @override
//   State<JobRequirementPage> createState() => _JobRequirementPageState();
// }

// class _JobRequirementPageState extends State<JobRequirementPage> {
//   TimeSlot? selectedTimeSlot;
//   bool isRemote = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: const Color(0xFFEEEBEB),
//         resizeToAvoidBottomInset: true,
//         appBar: AppBar(
//           backgroundColor: const Color(0xFFEEEBEB),
//           leading: IconButton(
//             color: Colors.black,
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               // Handle back arrow button press
//             },
//           ),
//           title: const Text(
//             "Post Task",
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             color: const Color(0xFFEEEBEB),
//             child: Center(
//               child: Card(
//                 color: Colors.white,
//                 margin: const EdgeInsets.all(20.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Any Requirements or tools needed?',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       TextFormField(
//                         decoration: const InputDecoration(
//                           //hintText: 'Requirements or tools',
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 3.0, color: Color(0xFF163a96)),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       const Text(
//                         'When do you need it to be done?',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       TextFormField(
//                         decoration: const InputDecoration(
//                           //hintText: 'Enter description',
//                           border: OutlineInputBorder(),
//                           suffixIcon: Icon(Icons.calendar_today_outlined),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 3, color: Color(0xFF163a96)),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       const Text(
//                         'Time of the task',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           RadioListTile<TimeSlot>(
//                             title: const Text('Morning'),
//                             value: TimeSlot.morning,
//                             groupValue: selectedTimeSlot,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedTimeSlot = value;
//                               });
//                             },
//                           ),
//                           RadioListTile<TimeSlot>(
//                             title: const Text('Afternoon'),
//                             value: TimeSlot.afternoon,
//                             groupValue: selectedTimeSlot,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedTimeSlot = value;
//                               });
//                             },
//                           ),
//                           RadioListTile<TimeSlot>(
//                             title: const Text('Evening'),
//                             value: TimeSlot.evening,
//                             groupValue: selectedTimeSlot,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedTimeSlot = value;
//                               });
//                             },
//                           ),
//                           RadioListTile<TimeSlot>(
//                             title: const Text('Mid-Morning'),
//                             value: TimeSlot.midMorning,
//                             groupValue: selectedTimeSlot,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedTimeSlot = value;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                       const Text(
//                         'Your estimated wage',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextFormField(
//                         decoration: const InputDecoration(
//                           //hintText: 'Requirements or tools',
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 3.0, color: Color(0xFF163a96)),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       Align(
//                         alignment: Alignment.center,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(
//                                 0xFF163a96), // Text Color background color)
//                           ),
//                           onPressed: () {
//                             // Handle continue button press
//                           },
//                           child: const Text('Continue'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

enum TimeSlot { morning, afternoon, evening, midMorning }

class JobRequirementPage extends StatefulWidget {
  const JobRequirementPage({super.key});

  @override
  State<JobRequirementPage> createState() => _JobRequirementPageState();
}

class _JobRequirementPageState extends State<JobRequirementPage> {
  TimeSlot? selectedTimeSlot;
  bool isRemote = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEEBEB),
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back arrow button press
            },
          ),
          title: const Text(
            "Post Task",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Any Requirements or tools needed?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      //hintText: 'Requirements or tools',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3.0, color: Color(0xFF163a96)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'When do you need it to be done?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      //hintText: 'Enter description',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today_outlined),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xFF163a96)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Time of the task',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<TimeSlot>(
                          title: const Text('Morning'),
                          value: TimeSlot.morning,
                          groupValue: selectedTimeSlot,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeSlot = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<TimeSlot>(
                          title: const Text('Afternoon'),
                          value: TimeSlot.afternoon,
                          groupValue: selectedTimeSlot,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeSlot = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<TimeSlot>(
                          title: const Text('Evening'),
                          value: TimeSlot.evening,
                          groupValue: selectedTimeSlot,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeSlot = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<TimeSlot>(
                          title: const Text('Mid-Morning'),
                          value: TimeSlot.midMorning,
                          groupValue: selectedTimeSlot,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeSlot = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Your estimated wage',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      //hintText: 'Requirements or tools',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3.0, color: Color(0xFF163a96)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF163a96), // Text Color background color)
                      ),
                      onPressed: () {
                        // Handle continue button press
                      },
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
