import 'package:elearning_app/screens/sign_in/sign_in.dart';
import 'package:elearning_app/screens/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/screens/onboarding/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: true,
            create: (context) => WelcomeBlocs(),
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(430.0, 932.0),
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.white
                ),
              ),
              home: const Welcome(),
              routes: {
                "signIn" : (context)=> const SignIn(),
              },
            );
          },
        ));
  }
}

