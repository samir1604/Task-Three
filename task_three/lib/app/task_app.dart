import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/injection.dart';
import 'package:task_three/routes.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserController(injector.get<AuthRepository>()))
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Three',
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      initialRoute: Provider.of<UserController>(context, listen: false)
              .isUserAuthenticated
          ? Routes.home
          : Routes.login,
      routes: {
        Routes.login: (_) => const LoginPage(),
        Routes.signup: (_) => SignUpPage(),
        Routes.home: (_) => const HomePage(),
      },
    );
  }
}
