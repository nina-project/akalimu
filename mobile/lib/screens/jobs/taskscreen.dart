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

import 'package:akalimu/data/models/job.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:akalimu/screens/jobs/job_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, appProvider, _) {
          return Column(
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
                  itemCount: appProvider.jobs.length,
                  itemBuilder: (context, index) {
                    Job job = appProvider.jobs[index];
                    return JobCard(job: job);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Job job;
  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(JobDetailsScreen.routeName, arguments: job.id);
      },
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListTile(
          leading: Container(
            width: 48.0,
            height: 48.0,
            decoration: const BoxDecoration(
              color: Color(0xFF163a96),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              job.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(),
            ),
          ),
          subtitle: Text(
            job.description ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
