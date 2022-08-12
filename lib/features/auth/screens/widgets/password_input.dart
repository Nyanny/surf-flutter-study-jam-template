import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.passwordController})
      : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      obscureText: true,
      controller: passwordController,
      onChanged: (value) {
        context.read<AuthBloc>().add(PasswordChanged(password: value));
      },
      decoration: InputDecoration(
          labelText: "Пароль",
          prefixIcon: const Icon(Icons.lock),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.5),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.5),
              borderSide: const BorderSide(color: Colors.green, width: 2.0))),
    );
  }
}
