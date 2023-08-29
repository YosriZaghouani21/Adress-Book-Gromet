import 'package:adress_book/views/common/app_bar.dart';
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
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                      HeightSpacer(size: 10),
                      // ReusableText(
                      //     text: "Senurior Developer",
                      //     style: appstyle(22, Color(kDark.value), FontWeight.w600))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
