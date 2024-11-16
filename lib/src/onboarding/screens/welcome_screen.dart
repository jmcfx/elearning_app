import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning_app/common/values/colors/colors.dart';
import 'package:elearning_app/src/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/src/onboarding/bloc/welcome_events.dart';
import 'package:elearning_app/src/onboarding/bloc/welcome_state.dart';
import 'package:elearning_app/src/onboarding/widgets/page_view_widgets.dart';
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
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (pageControllerIndex) {
                        // trigger te bloc event and emit a new state.
                        BlocProvider.of<WelcomeBlocs>(context)
                            .add(WelcomeEvents(pageIndex: pageControllerIndex));
                      },
                      children: [
                        page(
                          index: 0,
                          context: context,
                          buttonName: "Next",
                          title: "First see Learning",
                          subTitle:
                              "Forget about a for of paper all Knowledge in one learning",
                          imagePath: "assets/images/reading.png",
                          pageController: pageController,
                        ),
                        page(
                          index: 1,
                          context: context,
                          buttonName: "Next",
                          title: "Connect With Everyone",
                          subTitle:
                              "Always keep in touch with your tutor & friend.Let's get connected!",
                          imagePath: "assets/images/boy.png",
                          pageController: pageController,
                        ),
                        page(
                          index: 2,
                          context: context,
                          buttonName: "Get Started",
                          title: "Always Fascinated Learning",
                          subTitle:
                              "Anywhere,anytime. The time is at your discretion. so study whenever you want",
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