import 'package:elearning_app/src/features/home/bloc/home_events.dart';
import 'package:elearning_app/src/features/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(HomeStates()) {
    on<HomePageDotsEvents>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
