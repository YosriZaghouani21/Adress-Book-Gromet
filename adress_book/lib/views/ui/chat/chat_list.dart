import 'package:adress_book/views/common/app_bar.dart';
import 'package:adress_book/views/common/drawer/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Chat List',
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
    );
  }
}