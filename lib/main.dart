import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamodemo/bloc/student/student_bloc.dart';
import 'package:hamodemo/pages/mainpage.dart';
import 'package:hamodemo/utils/di/injectable.dart';

import 'bloc/classroom/classroom_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<StudentBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ClassroomBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
