import 'package:elearning_app/global.dart';
import 'package:elearning_app/src/features/app_dashboard/bloc/dashboard_bloc.dart';
import 'package:elearning_app/src/features/home/bloc/home_blocs.dart';
import 'package:elearning_app/src/features/home/home_screen.dart';
import 'routes.dart';
import 'package:elearning_app/src/features/app_dashboard/screens/dashboard_screens.dart';
import 'package:elearning_app/src/features/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/src/features/onboarding/screens/welcome_screen.dart';
import 'package:elearning_app/src/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/src/features/sign_in/screens/sign_in_screen.dart';
import 'package:elearning_app/src/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:elearning_app/src/features/sign_up/screens/sign_up.dart';
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
    //welcome... The default route is a set route for the welcome screen
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
      screen: const DashBoardScreens(),
      bloc: BlocProvider(
        create: (_) => DashboardBloc(),
      ),
    ),

    PageEntity(
      route: AppRoutes.homeRoutes,
      screen: const HomeScreen(),
      bloc: BlocProvider(
        create: (_) => HomeBlocs(),
      ),
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
      //shared Preference check....
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.initialRoutes && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const DashBoardScreens(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => SignInScreen(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.screen, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => SignInScreen(), settings: settings);
  }
}
