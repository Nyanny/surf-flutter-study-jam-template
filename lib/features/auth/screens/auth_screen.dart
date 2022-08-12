import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/features/auth/screens/widgets/auth_form_widget.dart';

/// Screen for authorization process.
///

class AuthScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AuthScreen());
  }

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: AuthForm(),
        ),
      ),
    );
  }
}
