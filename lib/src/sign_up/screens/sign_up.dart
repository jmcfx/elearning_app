import 'package:elearning_app/src/sign_in/widgets/sign_in_widget.dart';
import 'package:elearning_app/src/sign_up/auth_controller/sign_up_controller.dart';
import 'package:elearning_app/src/sign_up/bloc/sign_up_bloc.dart';
import 'package:elearning_app/src/sign_up/bloc/sign_up_events.dart';
import 'package:elearning_app/src/sign_up/bloc/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpStates>(builder: (context, state) {
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
                        func: (value) {
                          context
                              .read<SignUpBloc>()
                              .add(UserNameEvent(userName: value));
                        },
                      ),
                      reusableText(text: "Email"),
                      customTextFormField(
                        context: context,
                        hintText: "Enter your email",
                        textType: "email",
                        iconName: "user",
                        func: (value) {
                          context.read<SignUpBloc>().add(EmailEvent(email: value));
                        },
                      ),
                      reusableText(text: "Password"),
                      customTextFormField(
                        context: context,
                        hintText: "Enter your Password",
                        textType: "password",
                        iconName: "lock",
                        func: (value) {
                          context.read<SignUpBloc>().add(PasswordEvent(password: value));
                        },
                      ),
                      reusableText(text: "Confirm Password"),
                      customTextFormField(
                        context: context,
                        hintText: "Re-enter your Password",
                        textType: "password",
                        iconName: "lock",
                        func: (value) {
                          context.read<SignUpBloc>().add(
                                RePasswordEvent(rePassword: value),
                              );
                        },
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
                onTap: () {
                  SignUpController(context: context).handleEmailSignUp(
                    userName: state.userName,
                    email: state.email,
                    password: state.password,
                    rePassword: state.rePassword,
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
