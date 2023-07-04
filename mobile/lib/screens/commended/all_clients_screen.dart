import 'package:akalimu/data/models/client.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:akalimu/screens/commended/client_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllClientsScreen extends StatefulWidget {
  static const routeName = '/all_clients';
  const AllClientsScreen({super.key});

  @override
  State<AllClientsScreen> createState() => _AllClientsScreenState();
}

class _AllClientsScreenState extends State<AllClientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, _) {
      return Scaffold(
        body: ListView.builder(
          itemCount: appProvider.clients.length,
          itemBuilder: (context, index) {
            Client worker = appProvider.clients[index];
            return ClientCard(client: worker);
          },
        ),
      );
    });
  }
}

class ClientCard extends StatelessWidget {
  final Client client;
  const ClientCard({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ClientScreen.routeName, arguments: client.id);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFF163a96),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF163a96),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xFF163a96),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          client.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFF163a96),
                        ),
                        const SizedBox(width: 8),
                        Text(client.city ?? "Unnamed Location"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (client.phoneNumber != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Color(0xFF163a96),
                          ),
                          const SizedBox(width: 8),
                          Text(client.phoneNumber!),
                        ],
                      ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: Color(0xFF163a96),
                        ),
                        const SizedBox(width: 8),
                        Text(client.email),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
