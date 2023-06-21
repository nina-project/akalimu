// import 'package:flutter/material.dart';

// class TaskPage extends StatefulWidget {
//   const TaskPage({super.key});

//   @override
//   State<TaskPage> createState() => _TaskPageState();
// }

// class _TaskPageState extends State<TaskPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 color: Colors.grey[300],
//               ),
//               child: Row(
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0, right: 4.0),
//                     child: Icon(Icons.search),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search for a task',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: ListView(
//                 shrinkWrap: true,
//                 children: [
//                   Card(
//                     elevation: 2.0,
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: ListTile(
//                       leading: Container(
//                         width: 48.0,
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF163a96),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.shopping_bag,
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text('Delivery'),
//                       subtitle: Text(
//                           'I need a personal assistant to send my package to Nansana'),
//                       trailing: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'UGX 30,000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           //const SizedBox(height: 2.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     elevation: 2.0,
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: ListTile(
//                       leading: Container(
//                         width: 48.0,
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF163a96),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.shopping_bag,
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text('Delivery'),
//                       subtitle: Text(
//                           'I need a personal assistant to send my package to Nansana'),
//                       trailing: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'UGX 30,000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     elevation: 2.0,
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: ListTile(
//                       leading: Container(
//                         width: 48.0,
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF163a96),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.shopping_bag,
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text('Delivery'),
//                       subtitle: Text(
//                           'I need a personal assistant to send my package to Nansana'),
//                       trailing: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'UGX 30,000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     elevation: 2.0,
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: ListTile(
//                       leading: Container(
//                         width: 48.0,
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF163a96),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.shopping_bag,
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text('Delivery'),
//                       subtitle: Text(
//                           'I need a personal assistant to send my package to Nansana'),
//                       trailing: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'UGX 30,000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     elevation: 2.0,
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: ListTile(
//                       leading: Container(
//                         width: 48.0,
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF163a96),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.shopping_bag,
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text('Delivery'),
//                       subtitle: Text(
//                           'I need a personal assistant to send my package to Nansana'),
//                       trailing: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'UGX 30,000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     elevation: 2.0,
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: ListTile(
//                       leading: Container(
//                         width: 48.0,
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF163a96),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.shopping_bag,
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text('Delivery'),
//                       subtitle: Text(
//                           'I need a personal assistant to send my package to Nansana'),
//                       trailing: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'UGX 30,000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     elevation: 2.0,
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: ListTile(
//                       leading: Container(
//                         width: 48.0,
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF163a96),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.shopping_bag,
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text('Delivery'),
//                       subtitle: Text(
//                           'I need a personal assistant to send my package to Nansana'),
//                       trailing: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'UGX 30,000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TaskItem> taskItems = [
    TaskItem(
      categoryIcon: Icons.shopping_bag,
      categoryColor: const Color(0xFF163a96),
      category: 'Delivery',
      description: 'I need a personal assistant to send my package to Nansana',
    ),
    TaskItem(
      categoryIcon: Icons.cleaning_services,
      categoryColor: const Color(0xFF163a96),
      category: 'Cleaning',
      description: 'I need someone to clean my apartment on weekends',
    ),
    TaskItem(
      categoryIcon: Icons.shopping_cart,
      categoryColor: const Color(0xFF163a96),
      category: 'Shopping',
      description: 'I need someone to buy groceries for me',
    ),
    TaskItem(
      categoryIcon: Icons.shopping_bag,
      categoryColor: const Color(0xFF163a96),
      category: 'Delivery',
      description: 'I need a personal assistant to send my package to Nansana',
    ),
    TaskItem(
      categoryIcon: Icons.cleaning_services,
      categoryColor: const Color(0xFF163a96),
      category: 'Cleaning',
      description: 'I need someone to clean my apartment on weekends',
    ),
    TaskItem(
      categoryIcon: Icons.shopping_cart,
      categoryColor: const Color(0xFF163a96),
      category: 'Shopping',
      description: 'I need someone to buy groceries for me',
    ),
    TaskItem(
      categoryIcon: Icons.shopping_bag,
      categoryColor: const Color(0xFF163a96),
      category: 'Delivery',
      description: 'I need a personal assistant to send my package to Nansana',
    ),
    TaskItem(
      categoryIcon: Icons.cleaning_services,
      categoryColor: const Color(0xFF163a96),
      category: 'Cleaning',
      description: 'I need someone to clean my apartment on weekends',
    ),
    TaskItem(
      categoryIcon: Icons.shopping_cart,
      categoryColor: const Color(0xFF163a96),
      category: 'Shopping',
      description: 'I need someone to buy groceries for me',
    ),
    // Add more task items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[300],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: taskItems.length,
              itemBuilder: (context, index) {
                TaskItem taskItem = taskItems[index];
                return buildTaskCard(
                  categoryIcon: taskItem.categoryIcon,
                  categoryColor: taskItem.categoryColor,
                  category: taskItem.category,
                  description: taskItem.description,
                  //price: taskItem.price,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTaskCard({
    required IconData categoryIcon,
    required Color categoryColor,
    required String category,
    required String description,
  }) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
            color: categoryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            categoryIcon,
            color: Colors.white,
          ),
        ),
        title: Text(category),
        subtitle: Text(description),
      ),
    );
  }
}

class TaskItem {
  final IconData categoryIcon;
  final Color categoryColor;
  final String category;
  final String description;

  TaskItem({
    required this.categoryIcon,
    required this.categoryColor,
    required this.category,
    required this.description,
  });
}
