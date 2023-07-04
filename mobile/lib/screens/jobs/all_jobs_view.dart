import 'package:akalimu/data/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'taskscreen.dart';

class AllJobsView extends StatelessWidget {
  static const String routeName = '/all_jobs';
  const AllJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Jobs"),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, _) => appProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : appProvider.jobs.isEmpty
                ? const Center(
                    child: Text("No jobs found!"),
                  )
                : ListView.builder(
                    itemCount: appProvider.jobs.length,
                    itemBuilder: (context, index) {
                      final job = appProvider.jobs[index];
                      return JobCard(job: job);
                    },
                  ),
      ),
    );
  }
}
