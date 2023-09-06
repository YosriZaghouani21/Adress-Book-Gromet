import 'package:adress_book/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  // final JobsResponse job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.7,
          height: hieght * 0.27,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    // backgroundImage: NetworkImage(job.imageUrl),
                    backgroundImage: AssetImage('assets/images/Facebook.png'),
                  ),
                  const WidthSpacer(width: 15),
                  ReusableText(
                      text: 'Facebook',
                      style: appstyle(26, Color(kDark.value), FontWeight.w600)),
                ],
              ),
              const HeightSpacer(size: 15),
              ReusableText(
                  text: 'Senior Flutter dev',
                  style: appstyle(20, Color(kDark.value), FontWeight.w600)),
              ReusableText(
                  text: 'Toronto',
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
              const HeightSpacer(size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ReusableText(
                          text: '15K/',
                          style: appstyle(
                              23, Color(kDark.value), FontWeight.w600)),
                      ReusableText(
                          text: 'monthly',
                          style: appstyle(
                              23, Color(kDarkGrey.value), FontWeight.w600)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(kLight.value),
                    child: const Icon(Ionicons.chevron_forward),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}