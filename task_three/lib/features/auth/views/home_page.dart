import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
            onPressed: () {
              Provider.of<UserController>(context, listen: false).logOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.login, (_) => false);
            },
            child: Text('Cerrar session')),
      )),
    );
  }
}
