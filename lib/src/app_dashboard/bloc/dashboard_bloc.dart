import 'package:elearning_app/src/app_dashboard/bloc/dashboard_events.dart';
import 'package:elearning_app/src/app_dashboard/bloc/dashboard_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvents, DashboardStates> {
  DashboardBloc() : super(DashboardStates()) {
    on<TriggerAppEvent>((event, emit) {
      emit(DashboardStates(index: event.index));
    });
  }
}
