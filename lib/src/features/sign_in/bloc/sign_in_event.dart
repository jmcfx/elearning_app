 //Sign In Event is an abstract class. base type for related event...
abstract class SignInEvent {
  const SignInEvent();
}

//email.....
class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent({
    required this.email,
  });
}

//password....
class PasswordEvent extends SignInEvent {
  final String password;
  PasswordEvent({
    required this.password
  });

}
