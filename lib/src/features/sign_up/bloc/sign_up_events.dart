
//SingUp Events....
abstract class SignUpEvents {
  const SignUpEvents();
}


//userName....
class UserNameEvent extends SignUpEvents {
  final String userName;
  const UserNameEvent({ required this.userName});
}


//email....
class EmailEvent extends SignUpEvents {
  final String email;
  const EmailEvent({required this.email});
}


//password...
class PasswordEvent extends SignUpEvents {
  final String password;
  PasswordEvent({
    required this.password,
  });
}


//rePassword....
class RePasswordEvent extends SignUpEvents {
  final String rePassword;
  RePasswordEvent({
    required this.rePassword,
  });
}
