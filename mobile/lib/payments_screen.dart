import 'package:flutter/material.dart';
import 'package:akalimu/screens/main/maindrawerscreen.dart';
import 'package:akalimu/ratingscreen.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[600]),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Payments'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(24),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Gig ID'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Date'),
                      keyboardType: TextInputType.datetime,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Gig'),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Amount(UGX)'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.red,
                                          child: Icon(Icons.close),
                                        ),
                                      ),
                                    ),
                                    Form(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Would you like to Rate and and give a Review your employee?',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.amber,
                                                ),
                                                child: const Text(
                                                    'Rate and Review'),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Rating()),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.amber,
                                                ),
                                                child: const Text(
                                                  'Skip',
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MainDrawer(
                                                              userImage: '',
                                                            )),
                                                  );
                                                },
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                      ),
                      child: const Text(
                        'Pay',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
