import 'package:elearning_app/src/features/app_dashboard/bloc/dashboard_bloc.dart';
import 'package:elearning_app/src/features/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/src/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:elearning_app/src/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Class List of Bloc Providers.....
class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: true,
          create: (context) => WelcomeBlocs(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (create) => DashboardBloc(),
        )
      ];
}

