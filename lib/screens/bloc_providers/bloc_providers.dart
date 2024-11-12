import 'package:elearning_app/screens/onboarding/bloc/welcome_blocs.dart';
import 'package:elearning_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
      BlocProvider(
          lazy: true,
          create: (context) => WelcomeBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        )
  ];
}
