import 'package:elearning_app/common/values/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// AppBar .....
AppBar buildAppBar({ required text}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0.sp),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        //height defines the thickness of the line...
        height: 1.0,
      ),
    ),
    title: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

//third Party func... We need context for accessing bloc
Widget buildThirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(top: 45.h, bottom: 25.h),
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons(iconName: "google"),
        _reusableIcons(iconName: "apple"),
        _reusableIcons(iconName: "facebook")
      ],
    ),
  );
}

// Icons widget func ....
Widget _reusableIcons({required String iconName}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 50.w,
      height: 50.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

//text widget func .....
Widget reusableText({required String text}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
    ),
  );
}

// singIn Form widget func ......
Widget customTextFormField({
  required BuildContext context,
  required String hintText,
  required String textType,
  required String iconName,
  required void Function(String value)? func,
  FormFieldValidator<String?>? validator,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * .90.w,
    margin: EdgeInsets.only(bottom: 30.h),
    decoration: BoxDecoration(),
    child: TextFormField(
      
      onChanged: func,
      validator: validator,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18.r),
        hintText: hintText,
        suffix: SizedBox(
          height: 20,
        ),
        prefixIcon: Container(
          width: 20.w,
          height: 20.w,
          margin: EdgeInsets.only(
            left: 17.w,
            right: 10.w,
          ),
          child: Image.asset(
            "assets/icons/$iconName.png",
          ),
        ),
        prefixIconConstraints: BoxConstraints.tightFor(
          width: 50.r,
          height: 36.r,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryFourthElementText),
          borderRadius: BorderRadius.circular(15.r),  
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryFourthElementText),
          borderRadius: BorderRadius.circular(15.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryFourthElementText),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryElement, width: 2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        hintStyle: TextStyle(color: AppColors.primarySecondaryElementText),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.normal,
      ),
      autocorrect: false,
      obscureText: textType == "password" ? true : false,
    ),
    
  );
}

//forgot password widget func....

Widget forgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 44.h,
    child: Text(
      "Forgot password ",
      style: TextStyle(
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontSize: 14.sp,
      ),
    ),
  );
}

// custom Login And Reg Button func widget ......
Widget customLoginAndRegButton(
    {required BuildContext context,
    required String buttonName,
     String ? buttonType,
    required VoidCallback? onTap, 
    color }) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width * .90.w,
      height: 61.h,
      margin: EdgeInsets.only(
      left: 25.w,
        right: 25.w,
        top: buttonType == "LogIn" ? 70.h : 20.h,
      ),
      decoration: BoxDecoration(
        color: buttonType == "LogIn"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          //check for registration button Border...
          color: buttonName == "LogIn"
              ? Colors.transparent
              : AppColors.primaryFourthElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.r,
            blurRadius: 2.r,
            offset: Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color:  buttonType == "LogIn"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
