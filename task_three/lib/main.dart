import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_three/app/task_app.dart';
//import 'package:task_three/data/data_provider.dart';
import 'package:task_three/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setupInjector();
  //await injector.get<DataProvider>().init();
  runApp(const TaskApp());
}
