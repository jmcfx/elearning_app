import 'package:elearning_app/global.dart';
import 'package:elearning_app/src/common/values/constant.dart';
import 'package:elearning_app/src/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/src/core/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn({required String email, required String password}) async {
    try {
      if (email == "email" && password == "password") {
        //or BlocProvider.of<SignInBloc>(context).state ... trying to read the user email/password state after validation...
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;

        String password = state.password;

        //try firebase Auth.... assigning the emailAddress & password State to Firebase....
        try {
          //initialized  signInWithEmail and Password...
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          User? user = credential.user;

          //email verified....
          if (!user!.emailVerified) {
            toastInfo(msg: "You need to Verify");
            await credential.user!.sendEmailVerification();

            return;
          }
          if (user.emailVerified) {
            Global.storageService.setString(AppConstants.storageUserTokenKey, "12345678");

            Navigator.of(context)
                .pushNamedAndRemoveUntil("/dashBoard", (route) => false);
          }
        } on FirebaseAuthException catch (e) {
          toastInfo(
            msg: e.code.toString(),
          );
        } catch (e) {
          toastInfo(msg: "Authentication failed. User is null.");
          return;
        }
      }
    } catch (e) {
      "";
    }
  }
}
