part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginInitiateEvent extends LoginEvent {
  final String username;
  final String password;

  LoginInitiateEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class LogoutEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
