import 'package:flutter/material.dart';
//import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:akalimu/screens/main/mainappscreen.dart';
import 'package:akalimu/screens/main/maindrawerscreen.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 3.5;
  int starCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal[200],
          title: const Text("Rating and Review"),
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
        Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            bottom: 50.0,
          ),
          child: RatingStars(
            starSize: 25.0,
            // rating: rating,
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.orange,
            //borderColor: Colors.grey,
            starCount: starCount,
            onValueChanged: (rating) => setState(
              () {
                this.rating = rating;
              },
            ),
          ),
        ),
        Text(
          "Your rating is: $rating",
          style: const TextStyle(fontSize: 30.0),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          clipBehavior: Clip.antiAlias,
          color: Colors.grey,
          elevation: 5.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        "Write your Review here:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'your experience with the employee',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            child: TextButton(
                child: const Text('Submit'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(children: <Widget>[
                            Form(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Align(
                                      alignment: Alignment.center,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Review Submitted!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber,
                                        ),
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainPage()),
                                          );
                                        },
                                      ),
                                    ),
                                  ]),
                            ),
                          ]),
                        );
                      });
                }),
          ),
        ])
      ]),
    );
  }
}
