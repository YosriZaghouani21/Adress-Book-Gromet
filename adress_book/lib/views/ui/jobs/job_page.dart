import 'package:adress_book/views/common/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class JobPage extends StatefulWidget {
  const JobPage({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final String id;
  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: widget.title,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Entypo.bookmark),
            )
          ],
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(CupertinoIcons.arrow_left),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const HeightSpacer(size: 30),
                Container(
                  width: width,
                  height: hieght * 0.27,
                  color: Color(kLightGrey.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                      const HeightSpacer(size: 10),
                      const ReusableText(
                        text: "Senior Developer",
                        style: TextStyle(
                          fontSize: 22,
                          // color: Color(kDark.value),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const HeightSpacer(size: 5),
                      ReusableText(
                        text: "New York",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(kDark.value),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const HeightSpacer(size: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomOutlineBtn(
                              text: "Full-Time",
                              color: Colors.orange,
                              color2: Colors.white10,
                            ),
                            Row(
                              children: [
                                ReusableText(
                                  text: "10k",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(kDark.value),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                  child: ReusableText(
                                    text: "/monthly",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color(kDark.value),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(size: 20),
                ReusableText(
                  text: 'Job Description',
                  style: appstyle(22, Color(kDark.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 10),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: appstyle(
                    16,
                    Color(kDarkGrey.value),
                    FontWeight.normal,
                  ),
                ),
                const HeightSpacer(size: 20),
                ReusableText(
                  text: 'Job Requirements',
                  style: appstyle(22, Color(kDark.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 10),
                SizedBox(
                  height: hieght * 0.6,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: requirements.length,
                    itemBuilder: (context, index) {
                      final req = requirements[index];
                      String bullet = "\u2022";
                      return Text(
                        "$bullet  $req\n",
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        style: appstyle(
                            16, Color(kDarkGrey.value), FontWeight.normal),
                      );
                    },
                  ),
                ),
                const HeightSpacer(size: 20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomOutlineBtn(
                  onTap: () {},
                  color2: Color(kOrange.value),
                  width: width,
                  hieght: 60,
                  text: "Apply Now",
                  color: Color(kLight.value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
