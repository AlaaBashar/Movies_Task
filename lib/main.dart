import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'config/config.export.dart';
import 'core/core.export.dart';
import 'features/features.export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjectionInit().init();
  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Handle opened notifications here
  });
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    configOneSignal();
  }
  @override
  Widget build(BuildContext context) {
    return listOfBlocProviders(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Skills Task',
        home: HomeScreen(),
      ),
    );
  }
  void configOneSignal(){
    OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
    OneSignal.shared.setAppId('f7d07271-fec0-44ab-a804-a6a4f51e0eb8');
  }
}


