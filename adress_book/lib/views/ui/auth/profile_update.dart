import 'package:adress_book/constants/app_constants.dart';
import 'package:adress_book/controllers/exports.dart';
import 'package:adress_book/models/request/auth/profile_update_model.dart';
import 'package:adress_book/views/common/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../common/exports.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController skill0 = TextEditingController(text: profile[0]);
  TextEditingController skill1 = TextEditingController(text: profile[1]);
  TextEditingController skill2 = TextEditingController(text: profile[2]);
  TextEditingController skill3 = TextEditingController(text: profile[3]);
  TextEditingController skill4 = TextEditingController(text: profile[4]);

  @override
  void dispose() {
    phone.dispose();
    location.dispose();
    skill0.dispose();
    skill1.dispose();
    skill2.dispose();
    skill3.dispose();
    skill4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.profile);
    print(profile);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            text: "Update Profile",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                CupertinoIcons.arrow_left,
              ),
            ),
          ),
        ),
        body: Consumer<LoginNotifier>(
          builder: (context, LoginNotifier, child) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: "Personal Details",
                      style: appstyle(35, Color(kDark.value), FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Color(kLightBlue.value),
                        // backgroundImage: ,
                        child: const Center(
                          child: Icon(Icons.photo_filter_rounded),
                        ),
                      ),
                    )
                  ],
                ),
                const HeightSpacer(size: 20),
                Form(
                    child: Column(
                  children: [
                    CustomTextField(
                      controller: location,
                      hintText: "Location",
                      keyboardType: TextInputType.text,
                      validator: (location) {
                        if (location!.isEmpty) {
                          return "Please enter a valid location";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: phone,
                      hintText: "Phone Number",
                      keyboardType: TextInputType.phone,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return "Please enter a valid Phone Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    ReusableText(
                        text: "Professional Skills",
                        style:
                            appstyle(30, Color(kDark.value), FontWeight.bold)),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill0,
                      hintText: "Proffessional Skills",
                      keyboardType: TextInputType.text,
                      validator: (skill0) {
                        if (skill0!.isEmpty) {
                          return "Please enter a known skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill1,
                      hintText: "Proffessional Skills",
                      keyboardType: TextInputType.text,
                      validator: (skill1) {
                        if (skill1!.isEmpty) {
                          return "Please enter a known skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill2,
                      hintText: "Proffessional Skills",
                      keyboardType: TextInputType.text,
                      validator: (skill2) {
                        if (skill2!.isEmpty) {
                          return "Please enter a known skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill3,
                      hintText: "Proffessional Skills",
                      keyboardType: TextInputType.text,
                      validator: (skill3) {
                        if (skill3!.isEmpty) {
                          return "Please enter a known skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill4,
                      hintText: "Proffessional Skills",
                      keyboardType: TextInputType.text,
                      validator: (skill4) {
                        if (skill4!.isEmpty) {
                          return "Please enter a known skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 20),
                    CustomButton(
                        onTap: () {
                          ProfileUpdateReq model = ProfileUpdateReq(
                              location: location.text,
                              phone: phone.text,
                              // profile: 'imageUploada.imageUrl.toString()',
                              skills: [
                                skill0.text,
                                skill1.text,
                                skill2.text,
                                skill3.text,
                                skill4.text,
                              ]);

                          LoginNotifier.updateProfile(model);
                        },
                        text: "Update Profile")
                  ],
                )),
              ],
            );
          },
        ));
  }
}
