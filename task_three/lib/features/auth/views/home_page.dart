import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/routes.dart';
import 'package:task_three/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    final userController = Provider.of<UserController>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          icon: const Icon(Icons.delete),
                          title: const Text('Clean all registered users ?'),
                          actions: [
                            ElevatedButton.icon(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                                label: const Text('Cancel')),
                            ElevatedButton.icon(
                                onPressed: () {
                                  Provider.of<UserController>(context,
                                          listen: false)
                                      .clear();
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, Routes.login, (_) => false);
                                },
                                icon: const Icon(Icons.check),
                                label: const Text('Accept'))
                          ],
                        ));
              },
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: sizeHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: sizeHeight * .1),
            CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 100,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: sizeHeight * .05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          'User Profile',
                          style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const Divider(
                          color: Colors.black54,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userController.getRegisteredUser?.username ?? '',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userController.getRegisteredUser?.email ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white)),
                  onPressed: () {
                    Provider.of<UserController>(context, listen: false)
                        .logOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.login, (_) => false);
                  },
                  child: const Text('Close Session'),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      )),
    );
  }
}
