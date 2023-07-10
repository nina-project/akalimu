import 'package:akalimu/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/app_provider.dart';
import '../commended/client_screen.dart';

class JobDetailsScreen extends StatefulWidget {
  static const String routeName = '/job-details';
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      final int? jobId = ModalRoute.of(context)?.settings.arguments as int?;
      if (appProvider.selectedJob != null) {
        appProvider.findJobById(appProvider.selectedJob!.id!).then((value) {
          appProvider.findClientById(value.postedBy);
        });
      }
      if (jobId != null) {
        appProvider.findJobById(jobId).then((value) {
          appProvider.findClientById(value.postedBy);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int? jobId = ModalRoute.of(context)?.settings.arguments as int?;

    return Consumer<AppProvider>(builder: (context, appProvider, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF163a96),
          title: const Text('Job Details'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appProvider.selectedJob?.title ?? "_",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    const SizedBox(width: 5),
                    Text(appProvider.selectedJob?.location ?? "_"),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0)
                    .copyWith(bottom: 20),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.blueGrey,
                              size: 25,
                            ),
                            Text(
                              "Date posted",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.blueGrey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              formatDate(appProvider.selectedJob?.createdAt),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.attach_money,
                              color: Colors.blueGrey,
                              size: 25,
                            ),
                            Text(
                              "Salary",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.blueGrey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "UGX ${appProvider.selectedJob?.wage ?? "0"}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text("Posted by"),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ClientScreen.routeName,
                      arguments: appProvider.selectedClient?.id);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person_2_rounded),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        appProvider.selectedClient?.name ?? "",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              const Text("Description"),
              const SizedBox(
                height: 10,
              ),
              Text(
                appProvider.selectedJob?.description ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 30,
              ),
              Builder(builder: (context) {
                int userId = appProvider.userData?.id ?? 0;
                int creatorId = appProvider.selectedJob?.postedBy ?? 0;

                if (userId == creatorId) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      appProvider.deleteJob(appProvider.selectedJob!);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.check_circle_outline_outlined),
                        SizedBox(width: 5),
                        Text("Delete Job"),
                      ],
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Successfully applied for the job, We shall update you!"),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.check_circle_outline_outlined),
                          SizedBox(width: 5),
                          Text("Apply"),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Thank you for your feedback, Job removed from your recommendations"),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.cancel_outlined),
                          Text("Not interested"),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
