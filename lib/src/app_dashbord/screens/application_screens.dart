import 'package:elearning_app/common/values/colors/colors.dart';
import 'package:elearning_app/src/app_dashbord/widgets/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationScreens extends StatefulWidget {
  const ApplicationScreens({super.key});

  @override
  State<ApplicationScreens> createState() => _ApplicationScreensState();
}

class _ApplicationScreensState extends State<ApplicationScreens> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: pageIndexList(index: _index),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourthElementText,
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              elevation: 0,
              items: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
