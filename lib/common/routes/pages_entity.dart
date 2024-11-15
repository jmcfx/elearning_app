import 'package:elearning_app/common/routes/routes.dart';
import 'package:elearning_app/src/app_dashbord/screens/application_screens.dart';
import 'package:elearning_app/src/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/src/onboarding/screens/welcome_screen.dart';
import 'package:elearning_app/src/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/src/sign_in/screens/sign_in_screen.dart';
import 'package:elearning_app/src/sign_up/bloc/sign_up_bloc.dart';
import 'package:elearning_app/src/sign_up/screens/sign_up.dart';
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
    //welcome...
    PageEntity(
      route: AppRoutes.initialRoutes,
      screen: const WelcomeScreen(),
      bloc: BlocProvider(
        create: (_) => WelcomeBlocs(),
      ),
    ),
    // sign...
    PageEntity(
      route: AppRoutes.signInRoutes,
      screen: const SignInScreen(),
      bloc: BlocProvider(
        create: (_) => SignInBloc(),
      ),
    ),
    //signUp....
    PageEntity(
      route: AppRoutes.signUpRoutes,
      screen: const SignUp(),
      bloc: BlocProvider(
        create: (_) => SignUpBloc(),
      ),
    ),
    //app dashboard....
    PageEntity(
      route: AppRoutes.appDashboardRoutes,
      screen: const ApplicationScreens(),
      // bloc: BlocProvider( create: (_) => SignUpBloc()),
    ),
  ];

// looping through routeList then adding the blocs to a new blocProvider List .. return all the bloc Provider.....
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = [];
    for (var bloc in routesList) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //.. a modal that covers the entire screen as we click on navigator object....
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered...
      var result = routesList.where((e) => e.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.screen, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => SignInScreen(), settings: settings);
  }
}