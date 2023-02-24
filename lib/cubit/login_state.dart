
abstract class LoginState{}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState{}
class LoginSuccessfulState extends LoginState{}
class LoginFailuerState extends LoginState{
  String? message;
  LoginFailuerState({this.message});
}
class SignupLoadingState extends LoginState{}
class SignupSuccessfulState extends LoginState{}
class SignupFailuerState extends LoginState{
  String? message;
  SignupFailuerState({this.message});
}
