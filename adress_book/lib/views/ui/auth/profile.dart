import 'package:adress_book/constants/app_constants.dart';
import 'package:adress_book/views/common/app_bar.dart';
import 'package:adress_book/views/common/drawer/drawerWidget.dart';
import 'package:adress_book/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Profile',
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Image.asset(
                          "assets/images/user.png",
                          width: 80.w,
                          height: 100.w,
                        ),
                      ),
                    ],
                  ),
                  const WidthSpacer(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: 'Yosri Z',
                        style:
                            appstyle(20, Color(kDark.value), FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(MaterialIcons.location_pin,
                              color: Color(kDarkGrey.value)),
                          const WidthSpacer(width: 5),
                          ReusableText(
                              text: 'Washington DC',
                              style: appstyle(
                                  20, Color(kDark.value), FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Feather.edit,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            const HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  color: Color(kLightGrey.value),
                  width: width,
                  height: hieght * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Color(kLight.value),
                        margin: EdgeInsets.only(left: 12.w),
                        width: 60.w,
                        height: 70.h,
                        child: const Icon(
                          FontAwesome5Regular.file_pdf,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                            text: "Resume from here",
                            style: appstyle(
                              18,
                              Color(kDark.value),
                              FontWeight.w500,
                            ),
                          ),
                          ReusableText(
                            text: "Yosri's Resume ",
                            style: appstyle(
                              16,
                              Color(kDarkGrey.value),
                              FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const WidthSpacer(width: 1)
                    ],
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 5.h,
                  child: GestureDetector(
                    onTap: () {},
                    child: ReusableText(
                      text: "Edit ",
                      style: appstyle(
                        16,
                        Color(kOrange.value),
                        FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8),
              width: width,
              height: hieght * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                  text: 'yosri@gmail.com',
                  style: appstyle(16, Color(kDark.value), FontWeight.w600),
                ),
              ),
            ),
            const HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8),
              width: width,
              height: hieght * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Image.asset("assets/images/phone.png",
                        width: 30.w, height: 30.h),
                    ReusableText(
                      text: '+21690514345',
                      style: appstyle(16, Color(kDark.value), FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const HeightSpacer(size: 20),
            Container(
              color: Color(kLightGrey.value),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: ReusableText(
                      text: "Skills",
                      style: appstyle(16, Color(kDark.value), FontWeight.w600),
                    ),
                  ),
                  const HeightSpacer(size: 20),
                  SizedBox(
                    height: hieght * 0.5,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: ListView.builder(
                            itemCount: skills.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final skill = skills[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  width: width,
                                  height: hieght * 0.06,
                                  color: Color(kLight.value),
                                  child: ReusableText(
                                      text: skill,
                                      style: appstyle(16, Color(kDark.value),
                                          FontWeight.normal)),
                                ),
                              );
                            })),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
