import 'package:adress_book/controllers/exports.dart';
import 'package:adress_book/services/helpers/jobs_helper.dart';
import 'package:adress_book/views/common/exports.dart';
import 'package:adress_book/views/common/loader.dart';
import 'package:adress_book/views/ui/jobs/widgets/job_tile.dart';
import 'package:adress_book/views/ui/search/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(color: Color(kLight.value)),
        title: CustomField(
          hintText: "Search for a job",
          controller: search,
          onEditingComplete: () {
            setState(() {});
          },
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(AntDesign.search1),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              Image.asset("assets/images/optimized_search.png"),
              ReusableText(
                text: 'Search For Jobs',
                style: appstyle(
                  24,
                  Color(kDark.value),
                  FontWeight.bold,
                ),
              )
            ],
          )),
    );
  }
}
