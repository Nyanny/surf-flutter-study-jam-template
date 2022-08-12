import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/features/auth/models/token_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<AppInitialized>(_onAppInitialized);
    on<LoginChanged>(_onLoginChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  final IAuthRepository authRepository;

  void _onAppInitialized(AppInitialized event, Emitter<AuthState> emit) {
    emit(AppLoadingState());
    emit(AppInitializeState());
  }

  void _onLoginChanged(LoginChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        login: event.login,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    TokenDto tokenDto;
    final login = state.login;
    final password = state.password;
    try {
      emit(NetworkLoadingState());
      tokenDto = await authRepository.signIn(login: login, password: password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', tokenDto.token);
      emit(SuccessState());
    } catch (_) {
      emit(ErrorState());
    }
  }
}
