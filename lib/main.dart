import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/features/auth/repository/auth_repository.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

import 'bloc_navigation.dart';
import 'features/auth/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  MyApp({Key? key}) : super(key: key);
  final AuthRepository authRepository = AuthRepository(StudyJamClient());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider(
        create: (_) =>
            AuthBloc(authRepository: authRepository)..add(AppInitialized()),
        child: const BlocNavigation(),
      ),
    );
  }
}
