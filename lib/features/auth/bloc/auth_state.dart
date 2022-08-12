part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.login = '', this.password = ''});

  final String login;
  final String password;

  AuthState copyWith({
    String? login,
    String? password,
  }) {
    return AuthState(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [login, password];
}

class InitialState extends AuthState {}

class AppLoadingState extends AuthState {}

class NetworkLoadingState extends AuthState {}

class ErrorState extends AuthState {}

class SuccessState extends AuthState {}

class AppInitializeState extends AuthState {}
