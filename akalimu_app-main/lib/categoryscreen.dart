import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Delivery',
      'image': 'assets/images/delivery man.jpg',
    },
    {
      'name': 'Yardwork',
      'image': 'assets/images/garden-tools.jpg',
    },
    {
      'name': 'Cleaning',
      'image': 'assets/images/cleaning-products.jpg',
    },
    {
      'name': 'Photography',
      'image': 'assets/images/photographer.jpg',
    },
    {
      'name': 'Lifting',
      'image': 'assets/images/lifting.jpg',
    },
    {
      'name': 'Marketing',
      'image': 'assets/images/marketing.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF163a96),
        title: const Text('Select a category'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: categories.map((category) {
          return CategoryTile(category: category);
        }).toList(),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryTile({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: const Color(0xFF163a96),
      onTap: () {
        // TODO: Navigate to category page
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category['image'],
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 10),
          Text(
            category['name'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
