import 'package:elearning_app/src/common/values/colors/colors.dart';
import 'package:elearning_app/src/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// page Index List  Widget Func...
Widget pageIndexList({required int index}) {
  List<Widget> pageList = [
    Center(
      child: HomeScreen(),
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

//bottom NavBar List ...

List<BottomNavigationBarItem> bottomNavItem = [

  BottomNavigationBarItem(
    label: "Home",
    icon: NavImage(
      imagePath: "assets/icons/home.png",
    ),
    activeIcon: NavImage(
      imagePath: "assets/icons/home.png",
      isActive: true,
    ),
  ),
  BottomNavigationBarItem(
      label: "Search",
      icon: NavImage(
        imagePath: "assets/icons/search2.png",
      ),
      activeIcon: NavImage(
        imagePath: "assets/icons/search2.png",
        isActive: true,
      )),
  BottomNavigationBarItem(
      label: "Course",
      icon: NavImage(
        imagePath: "assets/icons/play-circle1.png",
      ),
      activeIcon: NavImage(
        imagePath: "assets/icons/play-circle1.png",
        isActive: true,
      )),
  BottomNavigationBarItem(
      label: "Chat",
      icon: NavImage(
        imagePath: "assets/icons/message-circle.png",
      ),
      activeIcon: NavImage(
        imagePath: "assets/icons/message-circle.png",
        isActive: true,
      )),
  BottomNavigationBarItem(
    label: "Profile",
    icon: NavImage(
      imagePath: "assets/icons/person2.png",
    ),
    activeIcon: NavImage(
      imagePath: "assets/icons/person2.png",
      isActive: true,
    ),
  )
];
