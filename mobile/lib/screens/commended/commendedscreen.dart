import 'package:akalimu/data/models/client.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/models/job.dart';
import 'client_screen.dart';

class CommendedScreen extends StatefulWidget {
  const CommendedScreen({super.key});

  @override
  State<CommendedScreen> createState() => _CommendedScreenState();
}

class _CommendedScreenState extends State<CommendedScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, _) {
      return Scaffold(
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: () async {
            await appProvider.fetchRecommendedJobs();

            _refreshController.refreshCompleted();
          },
          child: Builder(builder: (context) {
            if (appProvider.userJobs.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0).copyWith(top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "No jobs recommended at the moment",
                        style: TextStyle(color: Colors.black38),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Post a job to get recommendations",
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: appProvider.userJobs.length,
              itemBuilder: (context, index) {
                Job job = appProvider.userJobs[index];
                return _MyJobsCard(
                  job: job,
                );
              },
            );
          }),
        ),
      );
    });
  }
}

class _MyJobsCard extends StatefulWidget {
  final Job job;
  const _MyJobsCard({required this.job});

  @override
  State<_MyJobsCard> createState() => _MyJobsCardState();
}

class _MyJobsCardState extends State<_MyJobsCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        expansionCallback: (i, isOpen) {
          if (!isOpen) {
            Provider.of<AppProvider>(context, listen: false)
                .fetchRecommendedClientsForJob(widget.job.id!);
          }
          setState(() {
            isExpanded = !isOpen;
          });
        },
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: isExpanded,
            headerBuilder: (context, isOpen) {
              return Padding(
                padding: const EdgeInsets.all(12.0)
                    .copyWith(bottom: isOpen ? 0 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.job.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (!isOpen)
                      Text(
                        "Tap to view recommended professionals",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              );
            },
            body: Consumer<AppProvider>(
              builder: (context, appProvider, _) {
                return Padding(
                  padding: const EdgeInsets.all(12).copyWith(top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recommended Professionals",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      Builder(builder: (context) {
                        if (appProvider.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (appProvider.recommendedClients.isEmpty) {
                          return Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(12.0).copyWith(top: 30),
                              child: const Text(
                                "No professionals recommended at the moment",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: appProvider.recommendedClients.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Client worker =
                                  appProvider.recommendedClients[index];
                              return RecommendedProfessionalCard(
                                  client: worker);
                            },
                          ),
                        );
                      }),
                      Align(
                        child: IconButton(
                          onPressed: () => setState(() {
                            isExpanded = !isExpanded;
                          }),
                          icon: const Icon(Icons.keyboard_arrow_up),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedProfessionalCard extends StatelessWidget {
  final Client client;
  const RecommendedProfessionalCard({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ClientScreen.routeName, arguments: client.id);
      },
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        child: ListTile(
          leading: Container(
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              color: Color(0xFF163a96),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
          ),
          title: Text(
            client.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.location_on,
                size: 18,
                color: const Color(0xFF163a96).withOpacity(0.5),
              ),
              const SizedBox(width: 4),
              Text(client.city ?? "No location details"),
            ],
          ),
        ),
      ),
    );
  }
}
