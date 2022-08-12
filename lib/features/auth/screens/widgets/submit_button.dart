import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 400,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ErrorState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                  content: Text("Error: invalid 'login or 'password'"),
                ));
            }
          },
          builder: (context, state) {
            return MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5)),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                context.read<AuthBloc>().add(FormSubmitted());
              },
              child: const Text(
                "Далее",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
