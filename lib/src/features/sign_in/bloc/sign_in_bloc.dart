import 'package:elearning_app/src/features/sign_in/bloc/sign_in_event.dart';
import 'package:elearning_app/src/features/sign_in/bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//SignIn Bloc...
class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  SignInBloc() : super(SignInStates()) {
    //email Event Handler
    on<EmailEvent>(_emailEvent);

    //password event Handler...
    on<PasswordEvent>(_passwordEvent);
  }

// email Event Handler func....
  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    emit(
      state.copyWith(email: event.email),
    );
  }

// password Event handler....
  void _passwordEvent(PasswordEvent event, Emitter<SignInStates> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
}
