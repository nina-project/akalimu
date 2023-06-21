import 'package:flutter/material.dart';

import 'customcardscreen.dart';

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
    return Scaffold(
      body: ListView.builder(
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final data = cardData[index];
          return CustomCard(
            name: data['name'] ?? '',
            location: data['location'] ?? '',
            phone: data['phone'] ?? '',
          );
        },
      ),
    );
  }
}
