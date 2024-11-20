import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning_app/src/common/values/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildHomeAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 17.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/icons/person.png"),
              )),
            ),
          )
        ],
      ),
    ),
  );
}

// home Text Widget ......
Widget homeText(
    {required String text,
    Color? color = AppColors.primaryText,
    int top = 21}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

//search ....
Widget customSearchBar(BuildContext context) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //search bar....
      SizedBox(
        //  height: 50.h,
        width: MediaQuery.of(context).size.width * 0.75.h,
        child: SearchBar(
          padding: WidgetStatePropertyAll(EdgeInsets.all(5.r)),
          hintText: "search for courses..",
          backgroundColor: WidgetStatePropertyAll(AppColors.primaryBackground),
          elevation: WidgetStatePropertyAll(0),
          leading: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Image.asset(
              "assets/icons/search.png",
              height: 20.h,
              width: 20.w,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15).r,
              side: BorderSide(color: AppColors.primaryFourthElementText),
            ),
          ),
        ),
      ),
      //image....
      SizedBox(
        width: 10.w,
      ),
      GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * .10.w,
          height: 50.w,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

//slider View ....
Widget sliderView(BuildContext context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 22.h),
        width: MediaQuery.of(context).size.width * 0.85.w,
        height: 165.h,
        child: PageView(
          children: [
            _sliderContainer(context: context),
            _sliderContainer(
                context: context, path: "assets/icons/image_1.png"),
            _sliderContainer(context: context, path: "assets/icons/image_2.png")
          ],
        ),
      ),
      //dots indicator .....

      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: DotsIndicator(
          onTap: (value){},
          dotsCount: 3,
          position: 1,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: Size.square(6.0),
            activeSize: Size(20.0, 6.0),
            activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0.r),
            ),
          ),
        ),
      )
    ],
  );
}

//sliders container....
Widget _sliderContainer({
  context,
  String path = "assets/icons/Art.png",
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.80.w,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
      borderRadius: BorderRadius.circular(20.h),
    ),
  );
}

//dot indicator ....

