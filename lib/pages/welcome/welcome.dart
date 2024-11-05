import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:elearning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:elearning_app/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlocs, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 50.h),
              width: 430.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (pageIndex) {
                      // Update the State variable first ..
                      state.page = pageIndex;
                      // trigger te bloc event and emit a new state.
                      BlocProvider.of<WelcomeBlocs>(context)
                          .add(WelcomeEvents());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        "Next",
                        "First see Learning",
                        "Forget about a for of paper all Knowledge in one learning",
                        "assets/images/reading.png",
                        pageController,
                      ),
                      _page(
                          2,
                          context,
                          "Next",
                          "Connect With Everyone",
                          "Always keep in touch with your tutor & friend. Let's get connected",
                          "assets/images/boy.png",
                          pageController,),
                      _page(
                        3,
                        context,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere , anytime. The time is at our discretion so study whenever you want",
                        "assets/images/man.png",
                        pageController,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 160,
                    //dotIndicator.....
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        size: const Size.square(10.5),
                        activeSize: Size(19.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//Page Widget .....
Widget _page(int index, BuildContext context, String buttonName, String title,
    String subTitle, String imagePath, PageController pageController) {
  return Column(
    children: [
      //image....
      SizedBox(
        width: 400.w,
        height: 400.w,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        width: 430.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subTitle,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      //button....
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 110.h, left: 25.w, right: 25.w),
          width: 380.w,
          height: 65.h,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 1.2),
              )
            ],
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
