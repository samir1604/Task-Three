import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/features/auth/utils/message_extensions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameCtrl = TextEditingController();

  final _passwordCtrl = TextEditingController();

  final _userFocus = FocusNode();

  final _passwordFocus = FocusNode();

  final _obscurePassword = ValueNotifier<bool>(true);

  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = Provider.of<LoginController>(context, listen: false);
    _loginController.addListener(showMessage);
  }

  @override
  void dispose() {
    _loginController.removeListener(showMessage);
    super.dispose();
  }

  void showMessage() {
    context.showMessage(_loginController.exceptionMessage);
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    context.watch<LoginController>().exceptionMessage;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: sizeHeight * .05),
                const Icon(
                  Icons.supervised_user_circle_rounded,
                  size: 200,
                  color: Colors.white,
                ),
                SizedBox(height: sizeHeight * .1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: _formKey,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 15),
                              const Text(
                                'Initial Session',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _usernameCtrl,
                                keyboardType: TextInputType.name,
                                focusNode: _userFocus,
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_passwordFocus),
                                decoration: const InputDecoration(
                                  labelText: 'User',
                                  hintText: 'Enter user name',
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              const SizedBox(height: 15),
                              ValueListenableBuilder(
                                valueListenable: _obscurePassword,
                                builder: (_, value, __) {
                                  return TextFormField(
                                    controller: _passwordCtrl,
                                    obscureText: value,
                                    obscuringCharacter: '*',
                                    focusNode: _passwordFocus,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Enter password',
                                      prefixIcon: const Icon(Icons.lock),
                                      suffixIcon: InkWell(
                                        onTap: () => _obscurePassword.value =
                                            !_obscurePassword.value,
                                        child: value
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.blue)),
                                    child: const Text(
                                      'Log In',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Provider.of<LoginController>(context,
                                              listen: false)
                                          .signIn('', '');
                                    }),
                              ),
                              const SizedBox(height: 3),
                              const Divider(color: Colors.blue),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                    child: const Text(
                                      'Or Create an Account',
                                    ),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
