import 'package:flutter/material.dart';
import 'package:task_three/features/auth/auth.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Three',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'signup': (_) => const SignUpPage(),
        'home': (_) => const HomePage(),
      },
    );
  }
}
