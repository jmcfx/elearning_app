import 'package:elearning_app/firebase_options.dart';
import 'package:elearning_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/screens/sign_in/sign_in_screen.dart';
import 'package:elearning_app/screens/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/screens/onboarding/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
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
              appBarTheme:
                  AppBarTheme(elevation: 0, backgroundColor: Colors.white),
            ),
            home: const WelcomeScreen(),
            routes: {
              "signIn": (context) => const SignInScreen(),
              "homePage": (context) => const HomePage(),
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
