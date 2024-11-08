import 'package:elearning_app/screens/onboarding/bloc/welcome_events.dart';
import 'package:elearning_app/screens/onboarding/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBlocs extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBlocs() : super(WelcomeState()) {
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeState(page:state.page));
    });
  
  }
}
