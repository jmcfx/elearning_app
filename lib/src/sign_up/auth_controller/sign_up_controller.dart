
import 'package:elearning_app/src/sign_up/bloc/sign_up_bloc.dart';
import 'package:elearning_app/src/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController {
  final BuildContext context;

  SignUpController({required this.context});

// handle Email SignUp.....
  void handleEmailSignUp(
      {required String userName,
      required String email,
      required password,
      required rePassword}) async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    // validation.....
    if (userName.isEmpty) {
      toastInfo(msg: "Create a username");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "Enter email");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Enter password");
      return;
    }
    //
    if (rePassword.isEmpty) {
      toastInfo(msg: "Confirm password");
      return;
    }

    // try firebaseAuth for create User With Email and Password...
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An email has been sent to your registered email.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(msg: e.code.toString());
    }
  }
}
