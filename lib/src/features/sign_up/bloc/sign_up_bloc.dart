
import 'package:elearning_app/src/features/sign_up/bloc/sign_up_events.dart';
import 'package:elearning_app/src/features/sign_up/bloc/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBloc() : super(const SignUpStates()) {
    //userName Event Handler...
    on<UserNameEvent>(_userNameEvent);

    //email Event Handler...
    on<EmailEvent>(_emailEvent);

    //password Event Handler...
    on<PasswordEvent>(_passwordEvent);

    //rePassword Event Handler...
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
  
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
   
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<SignUpStates> emit) {
    
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
