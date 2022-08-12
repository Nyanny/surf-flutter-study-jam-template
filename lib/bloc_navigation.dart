import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_practice_chat_flutter/features/auth/bloc/auth_bloc.dart';
import 'package:surf_practice_chat_flutter/features/auth/screens/auth_screen.dart';
import 'package:surf_practice_chat_flutter/features/loading_screen.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

import 'features/chat/repository/chat_repository.dart';
import 'features/chat/screens/chat_screen.dart';

class BlocNavigation extends StatefulWidget {
  const BlocNavigation({Key? key}) : super(key: key);

  @override
  State<BlocNavigation> createState() => _BlocNavigationState();
}

class _BlocNavigationState extends State<BlocNavigation> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AppLoadingState) {
              _navigator.pushAndRemoveUntil<void>(
                LoadingScreen.route(),
                (route) => false,
              );
            }

            if (state is AppInitializeState) {
              _navigator.pushAndRemoveUntil<void>(
                AuthScreen.route(),
                (route) => false,
              );
            }

            if (state is SuccessState) {
              final prefs = await SharedPreferences.getInstance();

              final token = prefs.getString('token') ?? 0;
              _navigator.pushAndRemoveUntil<void>(
                ChatScreen(
                        chatRepository: ChatRepository(StudyJamClient()
                            .getAuthorizedClient(token.toString())))
                    .route(),
                (route) => false,
              );
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => LoadingScreen.route(),
    );
  }
}
