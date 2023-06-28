import 'package:akalimu/data/models/client.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:akalimu/screens/clients/client_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendationCardListView extends StatefulWidget {
  const RecommendationCardListView({super.key});

  @override
  State<RecommendationCardListView> createState() =>
      _RecommendationCardListViewState();
}

class _RecommendationCardListViewState
    extends State<RecommendationCardListView> {
  final List<Map<String, String>> cardData = [
    {
      'name': 'John Doe',
      'location': 'New York',
      'phone': '+1 123-456-7890',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles',
      'phone': '+1 234-567-8901',
    },
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, _) {
      return Scaffold(
        body: ListView.builder(
          itemCount: appProvider.workers.length,
          itemBuilder: (context, index) {
            Client worker = appProvider.workers[index];
            // final data = cardData[index];
            // return CustomCard(
            //   name: data['name'] ?? '',
            //   location: data['location'] ?? '',
            //   phone: data['phone'] ?? '',
            // );
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
