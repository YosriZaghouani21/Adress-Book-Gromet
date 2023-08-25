import 'package:adress_book/views/ui/widgets/page_one.dart';
import 'package:adress_book/views/ui/widgets/page_three.dart';
import 'package:adress_book/views/ui/widgets/page_two.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          )
        ],
      ),
    );
  }
}
