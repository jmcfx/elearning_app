import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning_app/src/common/values/colors/colors.dart';
import 'package:elearning_app/src/features/home/bloc/home_blocs.dart';
import 'package:elearning_app/src/features/home/bloc/home_events.dart';
import 'package:elearning_app/src/features/home/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    int top = 22}) {
  return Container(
    margin: EdgeInsets.only(
      top: top.h,
    ),
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
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //search bar....
      Expanded(
        child: SizedBox(
          height: 50.h,
          child: SearchBar(
            padding: WidgetStatePropertyAll(EdgeInsets.all(5.r)),
            hintText: "search for courses..",
            backgroundColor:
                WidgetStatePropertyAll(AppColors.primaryBackground),
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
                borderRadius: BorderRadius.circular(20).r,
                side: BorderSide(color: AppColors.primaryFourthElementText),
              ),
            ),
          ),
        ),
      ),
      //image....
      SizedBox(
        width: 20,
      ),
      GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * .11.w,
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
Widget sliderView({required BuildContext context, required HomeStates state}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 30.h),
        // width: MediaQuery.of(context).size.width * 0.80.w,
        height: 170.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBlocs>().add(HomePageDotsEvents(index: value));
          },
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
          dotsCount: 3,
          position: state.index,
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
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
      borderRadius: BorderRadius.circular(20.h),
    ),
  );
}

//menu View for Showing items ....
Widget menuView({
  required BuildContext context,
  Color color = AppColors.primaryText,
  int top = 20,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _reusableText(text: "Choose your course"),
        _reusableText(text: "see all"),
      ],
    ),
  );
}

// reusable text ........
Widget _reusableText({required String text}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    ),
  );
}
