import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/features/auth/utils/message_extensions.dart';
import 'package:task_three/routes.dart';
import 'package:task_three/theme/app_colors.dart';

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

  late UserController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<UserController>(context, listen: false);
    _controller.addListener(onStateChange);
  }

  @override
  void dispose() {
    _controller.removeListener(onStateChange);
    super.dispose();
  }

  void onStateChange() {
    _controller.state.whenOrNull(
      login: (user) {
        if (user != null) {
          Navigator.pushNamed(context, Routes.home);
        }
      },
      signUp: (user) {
        if (user != null) {
          context.showMessage('User successfully registered');
        }
      },
      error: (message) => context.showMessage(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final loginController = Provider.of<UserController>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: sizeHeight * .05),
                Icon(
                  Icons.supervised_user_circle_rounded,
                  size: 200,
                  color: AppColors.textColor,
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
                              if (loginController.state is AuthStateLoading)
                                const SizedBox(
                                    height: 21,
                                    width: 21,
                                    child: CircularProgressIndicator())
                              else
                                Text(
                                  'Initial Session',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _usernameCtrl,
                                keyboardType: TextInputType.name,
                                focusNode: _userFocus,
                                readOnly:
                                    loginController.state is AuthStateLoading,
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_passwordFocus),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'User name must be valid name'
                                        : null,
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
                                    readOnly: loginController.state
                                        is AuthStateLoading,
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'Password must be valid'
                                            : null,
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
                                  onPressed: loginController.state
                                          is AuthStateLoading
                                      ? null
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Provider.of<UserController>(context,
                                                    listen: false)
                                                .signIn(_usernameCtrl.text,
                                                    _passwordCtrl.text);
                                          }
                                        },
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Divider(color: Colors.blue),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed:
                                      loginController.state is AuthStateLoading
                                          ? null
                                          : () async {
                                              final result =
                                                  await Navigator.pushNamed(
                                                      context, Routes.signup);

                                              final signUpData =
                                                  result as Map<String, String>;
                                              _usernameCtrl.text =
                                                  signUpData['username'] ?? '';
                                              _passwordCtrl.text =
                                                  signUpData['password'] ?? '';
                                            },
                                  child: const Text(
                                    'Or Create an Account',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () =>
                                        Provider.of<UserController>(context,
                                                listen: false)
                                            .clear(),
                                    child: const Text('Clear')),
                              )
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
