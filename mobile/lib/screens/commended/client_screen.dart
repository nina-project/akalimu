import 'package:akalimu/data/providers/app_provider.dart';
import 'package:akalimu/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientScreen extends StatefulWidget {
  static const String routeName = '/client';
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final int? clientId = ModalRoute.of(context)?.settings.arguments as int?;
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      if (appProvider.selectedClient != null) {
        appProvider.findClientById(appProvider.selectedClient!.id);
      }
      if (clientId != null) {
        appProvider.findClientById(clientId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color(0xFF163a96),
        title: const Text('User Details'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        child: Icon(
                          Icons.person_2_rounded,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        appProvider.selectedClient?.name ?? "_",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.grey.withOpacity(0.6),
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(appProvider.selectedClient?.city ??
                                "No location details"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          openUrl('mailto:${appProvider.selectedClient?.email}') //"mailto:<email address>?subject=<subject>&body=<body>"
                              .catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error.toString()),
                              ),
                            );
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          side: const BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.email,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Send Email",
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
