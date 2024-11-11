import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning_app/common/values/colors/colors.dart';
import 'package:elearning_app/screens/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/screens/onboarding/bloc/welcome_events.dart';
import 'package:elearning_app/screens/onboarding/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBlocs, WelcomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
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
                          index: 1,
                          context: context,
                          buttonName: "Next",
                          title: "First see Learning",
                          subTitle:
                              "Forget about a for of paper all Knowledge in one learning",
                          imagePath: "assets/images/reading.png",
                          pageController: pageController,
                        ),
                        _page(
                          index: 2,
                          context: context,
                          buttonName: "Next",
                          title: "Connect With Everyone",
                          subTitle:
                              "Always keep in touch with your tutor & friend. Let's get connected",
                          imagePath: "assets/images/boy.png",
                          pageController: pageController,
                        ),
                        _page(
                          index: 3,
                          context: context,
                          buttonName: "Get Started",
                          title: "Always Fascinated Learning",
                          subTitle:
                              "Anywhere,anytime. The time is at our discretion so study whenever you want",
                          imagePath: "assets/images/man.png",
                          pageController: pageController,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 125.h,
                      //dotIndicator.....
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: AppColors.primaryThirdElementText,
                          size: const Size.square(10.5),
                          activeSize: Size(19.0.sp, 8.0.sp),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0).r,
                          ),
                          activeColor: AppColors.primaryElement,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//Page Widget .....
Widget _page(
    {required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
    required PageController pageController}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      //image....
      SizedBox(
        width: MediaQuery.of(context).size.width * .95.w,
        height: 400.w,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 26.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        width: 430.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          subTitle,
          style: TextStyle(
            color: AppColors.primarySecondaryElementText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      //button....
      GestureDetector(
        onTap: () {
          if (index < 3) {
            //animation
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          } else {
            //jump to new page...
            Navigator.of(context)
                .pushNamedAndRemoveUntil("signIn", (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 90.h, left: 25.w, right: 25.w),
          width: MediaQuery.of(context).size.width,
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
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
