
import 'package:elearning_app/src/features/sign_in/auth_controller/sign_in_controller.dart';
import 'package:elearning_app/src/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/src/features/sign_in/bloc/sign_in_event.dart';
import 'package:elearning_app/src/features/sign_in/bloc/sign_in_states.dart';
import 'package:elearning_app/src/features/sign_in/widgets/sign_in_widget.dart';
import 'package:elearning_app/src/core/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInStates>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(
          text: "Login In"
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //email.....
                      reusableText(text: "Email"),
                      SizedBox(
                        height: 5.h,
                      ),
                      //
                      customTextFormField(
                        //read email Block event
                        func: (value) => context.read<SignInBloc>().add(
                              EmailEvent(email: value),
                            ),
                        context: context,
                        hintText: "Enter your email ",
                        textType: "email",
                        iconName: "user",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            toastInfo(msg: "You need to fill an email");
                            return 'Email cannot be empty';
                          }
                          return null;
                        },
                      ),
                      //password....
                      reusableText(text: "Password"),
                      SizedBox(
                        height: 5.h,
                      ),
                      customTextFormField(
                          // read Block Event...
                          func: (value) => context.read<SignInBloc>().add(
                                PasswordEvent(password: value),
                              ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            }
                            return null;
                          },
                          context: context,
                          hintText: "Enter your password",
                          textType: "password",
                          iconName: "lock"),
                      //forgot password....
                      forgotPassword()
                    ],
                  ),
                ),
                //Button....
                customLoginAndRegButton(
                  buttonType: 'LogIn',
                  context: context,
                  buttonName: "Log In",
                   onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      SignInController(context: context)
                          .handleSignIn(email: "email", password: "password");
                    }
                  },
                ),
                //Button
                customLoginAndRegButton(
                  buttonType: 'SignUp', 
                  context: context,
                  buttonName: "Sign Up",
                    onTap: () {
                    Navigator.of(context).pushNamed("/signUp", );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
