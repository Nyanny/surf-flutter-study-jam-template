import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/features/auth/screens/widgets/password_input.dart';
import 'package:surf_practice_chat_flutter/features/auth/screens/widgets/submit_button.dart';

import 'login_input.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginInput(
            loginController: _loginController,
          ),
          const Divider(
            height: 10,
            color: Colors.transparent,
          ),
          PasswordInput(passwordController: _passwordController),
          const Divider(
            color: Colors.transparent,
          ),
          const SubmitButton(),
        ],
      ),
    );
  }
}
