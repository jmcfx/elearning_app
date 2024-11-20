import 'package:elearning_app/global.dart';
import 'package:elearning_app/src/common/values/colors/colors.dart';
import 'package:elearning_app/src/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Page View widget Function.....
Widget page(
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
      //title
      Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 25.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      //subtitle...
      Container(
        margin: EdgeInsets.only(left: 15.w, top: 10.h),
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
          if (index < 2) {
            //animation
            pageController.animateToPage(
              index + 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          } else {
            //jump to new page...
            Global.storageService
                .setBool(AppConstants.storageDeviceOpenFirstTime, true);
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/signIn", (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 90.h,
          ),
          width: MediaQuery.of(context).size.width * .90.w,
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
