part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginChanged extends AuthEvent {
  const LoginChanged({required this.login});

  final String login;

  @override
  List<Object> get props => [login];
}

class PasswordChanged extends AuthEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends AuthEvent {}

class AppInitialized extends AuthEvent {}
