import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/core.export.dart';
import 'features/features.export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjectionInit().init();
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Skills Task',
      home: HomeScreen(),
    );
  }
}


