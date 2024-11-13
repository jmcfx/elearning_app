import 'package:elearning_app/src/app_dashbord/widgets/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationScreens extends StatefulWidget {
  const ApplicationScreens({super.key});

  @override
  State<ApplicationScreens> createState() => _ApplicationScreensState();
}

class _ApplicationScreensState extends State<ApplicationScreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(0),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                label: "home",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
              ),
               BottomNavigationBarItem(
                label: "search",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
