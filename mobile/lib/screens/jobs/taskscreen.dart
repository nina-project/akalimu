import 'package:akalimu/data/models/job.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:akalimu/screens/jobs/all_jobs_view.dart';
import 'package:akalimu/screens/jobs/job_details_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, appProvider, _) {
          return SmartRefresher(
            controller: _refreshController,
            onRefresh: () async {
              await appProvider.fetchRecommendedJobs();

              _refreshController.refreshCompleted();
            },
            child: Column(
              children: [
                if (appProvider.recommendedJobs.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "You have no job recommendations at the moment!",
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Refresh or ",
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                            children: [
                              TextSpan(
                                text: "view all",
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    appProvider.fetchAllJobs();
                                    Navigator.of(context)
                                        .pushNamed(AllJobsView.routeName);
                                  },
                              ),
                              const TextSpan(
                                text: " available jobs",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: appProvider.recommendedJobs.length,
                    itemBuilder: (context, index) {
                      Job job = appProvider.recommendedJobs[index];
                      return JobCard(job: job);
                    },
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
