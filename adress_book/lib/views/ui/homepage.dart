import 'package:adress_book/constants/app_constants.dart';
import 'package:adress_book/controllers/job_provider.dart';
import 'package:adress_book/views/common/drawer/drawerWidget.dart';
import 'package:adress_book/views/common/exports.dart';
import 'package:adress_book/views/common/vertical_tile.dart';
import 'package:adress_book/views/ui/jobs/job_page.dart';
import 'package:adress_book/views/ui/jobs/widgets/horizontal_tile.dart';
import 'package:adress_book/views/ui/search/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(12.h),
                child: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
              )
            ],
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const DrawerWidget(),
            ),
          ),
        ),
        body: Consumer<JobsNotifier>(
          builder: (context, jobNotifier, child) {
            jobNotifier.getJobs();
            jobNotifier.getRecent();
            return SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpacer(size: 10),
                    Text(
                      "Search \nFind & Apply",
                      style: appstyle(40, Color(kDark.value), FontWeight.bold),
                    ),
                    const HeightSpacer(size: 40),
                    SearchWidget(
                      onTap: () {
                        Get.to(() => const SearchPage());
                      },
                    ),
                    const HeightSpacer(size: 30),
                    HeadingWidget(
                      text: "Popular Jobs",
                      onTap: () {
                        // Get.to(() => const JobListPage());
                      },
                    ),
                    const HeightSpacer(size: 15),
                    SizedBox(
                      height: hieght * 0.28,
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return JobHorizontalTile(
                              onTap: () {
                                Get.to(() =>
                                    const JobPage(title: "Facebook", id: '12'));
                              },
                            );
                          }),
                    )
                    // SizedBox(
                    //     height: hieght * 0.28,
                    //     child: FutureBuilder(
                    //         future: jobNotifier.jobList,
                    //         builder: (context, snapshot) {
                    //           if (snapshot.connectionState ==
                    //               ConnectionState.waiting) {
                    //             return const HorizontalShimmer();
                    //           } else if (snapshot.hasError) {
                    //             return Text("Error ${snapshot.error}");
                    //           } else {
                    //             final jobs = snapshot.data;
                    //             return ListView.builder(
                    //                 itemCount: jobs!.length,
                    //                 scrollDirection: Axis.horizontal,
                    //                 itemBuilder: (context, index) {
                    //                   final job = jobs[index];
                    //                   return JobHorizontalTile(
                    //                     onTap: () {
                    //                       Get.to(() => JobPage(
                    //                           title: job.company, id: job.id));
                    //                     },
                    //                     job: job,
                    //                   );
                    //                 });
                    //           }
                    //         })),
                    ,

                    const HeightSpacer(size: 20),
                    HeadingWidget(
                      text: "Recently Posted",
                      onTap: () {},
                    ),
                    const HeightSpacer(size: 20),
                    SizedBox(
                      height: hieght * 0.28,
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return VerticalTile(
                              onTap: () {},
                            );
                          }),
                    ),
                    // FutureBuilder(
                    //     future: jobNotifier.recent,
                    //     builder: (context, snapshot) {
                    //       if (snapshot.connectionState ==
                    //           ConnectionState.waiting) {
                    //         return const VerticalShimmer();
                    //       } else if (snapshot.hasError) {
                    //         return Text("Error ${snapshot.error}");
                    //       } else {
                    //         final jobs = snapshot.data;
                    //         return VerticalTile(
                    //           onTap: () {
                    //             Get.to(() =>
                    //                 JobPage(title: jobs!.company, id: jobs.id));
                    //           },
                    //           job: jobs,
                    //         );
                    //       }
                    //     }),
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
