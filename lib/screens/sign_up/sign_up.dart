import 'package:elearning_app/screens/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(text: "Sign Up"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: reusableText(
                text: "Enter you details below & Sign Up for Free",
              ),
            ),
            //form...
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              margin: EdgeInsets.only(top: 40.h),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText(text: "User name"),
                    customTextFormField(
                      context: context,
                      hintText: "Enter your user name",
                      textType: "email",
                      iconName: "user",
                      func: (value) {},
                    ),
                    reusableText(text: "Email"),
                    customTextFormField(
                      context: context,
                      hintText: "Enter your email",
                      textType: "email",
                      iconName: "user",
                      func: (value) {},
                    ),
                    reusableText(text: "Password"),
                    customTextFormField(
                      context: context,
                      hintText: "Enter your Password",
                      textType: "password",
                      iconName: "lock",
                      func: (value) {},
                    ),
                    reusableText(text: "Confirm Password"),
                    customTextFormField(
                      context: context,
                      hintText: "Re-enter your Password",
                      textType: "password",
                      iconName: "lock",
                      func: (value) {},
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .90.h,
                      child: reusableText(
                        text:
                            "By creating an account you have to agree with our terms and condition. ",
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ),
            //Button...
            customLoginAndRegButton(
              context: context,
              buttonType: 'LogIn',
              buttonName: "Create Account",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
