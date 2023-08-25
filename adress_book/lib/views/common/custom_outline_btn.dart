import 'package:adress_book/views/common/app_style.dart';
import 'package:adress_book/views/common/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      this.width,
      this.hieght,
      required this.text,
      this.onTap,
      required this.color,
      this.color2});

  final double? width;
  final double? hieght;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color? color2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: hieght,
          decoration: BoxDecoration(
            color: color2,
            border: Border.all(width: 1, color: color),
          ),
          child: Center(
            child: ReusableText(
                text: text, style: appstyle(16, color, FontWeight.w600)),
          ),
        ));
  }
}
