import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_three/app/task_app.dart';
import 'package:task_three/data/persistence_provider.dart';
import 'package:task_three/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setup();
  injector.get<PersistenceProvider>().init();
  runApp(const TaskApp());
}
