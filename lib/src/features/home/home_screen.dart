import 'package:elearning_app/src/common/values/colors/colors.dart';
import 'package:elearning_app/src/features/home/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildHomeAppBar(),
        body: Container(
         
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeText(
                      text: "Hello,", color: AppColors.primaryThirdElementText),
                  homeText(
                      text: "Onyedikachukwu",
                      color: AppColors.primaryText,
                      top: 5),
                  SizedBox(
                    height: 22.h,
                  ),
                  // searchBar
                  customSearchBar(context),

                  sliderView(context)
                ],
              ),
            ],
          ),
        ));
  }
}
