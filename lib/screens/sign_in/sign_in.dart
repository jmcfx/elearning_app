import 'package:elearning_app/screens/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //third party login .....
            buildThirdPartyLogin(),
            //use email ....
            Center(
              child: reusableText(
                text: "or Use your email account to login",
              ),
            ),
            //form...
            Container(
              margin: EdgeInsets.only(top: 50.h),
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //email.....
                  reusableText(text: "Email"),
                  SizedBox(
                    height: 5.h,
                  ),
                  customTextField(
                      context: context,
                      hintText: "Enter your email ",
                      textType: "email",
                      iconName: "user"),
                  //password....
                  reusableText(text: "Password"),
                  SizedBox(
                    height: 5.h,
                  ),
                  customTextField(
                      context: context,
                      hintText: "Enter your password",
                      textType: "password",
                      iconName: "lock"),
                  //forgot password....
                  forgotPassword()
                ],
              ),
            ),
            customLoginAndRegButton(
              context: context,
              buttonName: "Log In",
            ),
            customLoginAndRegButton(
              context: context,
              buttonName: "Sign In",
            ),
          ],
        ),
      ),
    );
  }
}
