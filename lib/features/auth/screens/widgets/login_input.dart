import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/features/auth/bloc/auth_bloc.dart';

class LoginInput extends StatelessWidget {
  const LoginInput({Key? key, required this.loginController}) : super(key: key);

  final TextEditingController loginController;

  @override
  Widget build(BuildContext context) {
    final AuthBloc myFormBloc = context.read<AuthBloc>();
    return TextFormField(
      autofocus: true,
      controller: loginController,
      onChanged: (value) {
        myFormBloc.add(LoginChanged(login: value));
      },
      decoration: InputDecoration(
          labelText: "Логин",
          prefixIcon: const Icon(Icons.person),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.5),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.5),
              borderSide: const BorderSide(color: Colors.green, width: 2.0))),
    );
  }
}
