import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/injection.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => LoginController(injector.get<AuthRepository>()))
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Provider.of<LoginController>(context, listen: false)
              .isUserAuthenticated
          ? 'home'
          : 'login',
      routes: {
        'login': (_) => const LoginPage(),
        'signup': (_) => const SignUpPage(),
        'home': (_) => const HomePage(),
      },
    );
  }
}
