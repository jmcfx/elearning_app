import 'package:elearning_app/src/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/src/widgets/flutter_toast.dart';
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
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }

          var user = credential.user;

          if (user != null) {
            //we got verified user from Firebase ...
          } else {
            toastInfo(msg: "Currently you are  not a user of this app");
            return;
            //we have error getting user from firebase ...
          }
        } on FirebaseAuthException catch (e) {
          toastInfo(
            msg: e.code.toString(),
          );
        }
      }
    } catch (e) {
      return;
    }
  }
}
