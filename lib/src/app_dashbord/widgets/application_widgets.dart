import 'package:elearning_app/common/values/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// page Index List  Widget Func...
Widget pageIndexList({required int index}) {
  List<Widget> pageList = [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Course"),
    ),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("Profile"),
    )
  ];

  return pageList[index];
}


//Nave Image Icons....
class NavImage extends StatelessWidget {
  const NavImage({
    super.key,
    required this.imagePath,
    this.isActive = false,
  });
  final String imagePath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset(
        imagePath,
        color: isActive ? AppColors.primaryElement : null,
      ),
    );
  }
}
