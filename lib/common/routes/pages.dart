import 'package:elearning_app/common/routes/routes.dart';
import 'package:elearning_app/src/app_dashbord/screens/application_screens.dart';
import 'package:elearning_app/src/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/src/onboarding/screens/welcome_screen.dart';
import 'package:elearning_app/src/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/src/sign_in/screens/sign_in_screen.dart';
import 'package:elearning_app/src/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//unify BlocProvider and routes and screens...
class PageEntity {
  String route;
  Widget screen;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.screen,
    this.bloc,
  });
}

// AppPages Class....
class AppPages {
  
  static List<PageEntity> routesList = [
    PageEntity(
      route: AppRoutes.initialRoutes,
      screen: const WelcomeScreen(),
      bloc: BlocProvider(
        create: (_) => WelcomeBlocs(),
      ),
    ),
    PageEntity(
      route: AppRoutes.signInRoutes,
      screen: const SignInScreen(),
      bloc: BlocProvider(
        create: (_) => SignInBloc(),
      ),
    ),
    PageEntity(
      route: AppRoutes.signUpRoutes,
      screen: const SignInScreen(),
      bloc: BlocProvider(
        create: (_) => SignUpBloc(),
      ),
    ),
    PageEntity(
      route: AppRoutes.appDashboardRoutes,
      screen: const ApplicationScreens(),
      // bloc: BlocProvider( create: (_) => SignUpBloc()),
    ),
  ];




//
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = [];
    for (var bloc in routesList) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
  
}
