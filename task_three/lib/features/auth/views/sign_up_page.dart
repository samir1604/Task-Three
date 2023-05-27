import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/model/user.dart';
import 'package:task_three/theme/app_colors.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _usernameCtrl = TextEditingController();

  final _passwordCtrl = TextEditingController();

  final _emailCtrl = TextEditingController();

  final _userFocus = FocusNode();

  final _passwordFocus = FocusNode();

  final _emailFocus = FocusNode();

  final _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final loginController = Provider.of<UserController>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: sizeHeight * .05),
                  CircleAvatar(
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: AppColors.textColor,
                    ),
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 15),
                                  if (loginController.state is AuthStateLoading)
                                    const SizedBox(
                                      height: 21,
                                      width: 21,
                                      child: CircularProgressIndicator(),
                                    )
                                  else
                                    Text(
                                      'Create new account',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.backgroundColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: _usernameCtrl,
                                    keyboardType: TextInputType.name,
                                    focusNode: _userFocus,
                                    readOnly: loginController.state
                                        is AuthStateLoading,
                                    onFieldSubmitted: (_) =>
                                        FocusScope.of(context)
                                            .requestFocus(_passwordFocus),
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'User name must be valid name'
                                            : null,
                                    decoration: const InputDecoration(
                                        labelText: 'User',
                                        hintText: 'Enter user name',
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder()),
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
                                        onFieldSubmitted: (_) =>
                                            FocusScope.of(context)
                                                .requestFocus(_emailFocus),
                                        validator: (value) =>
                                            value == null || value.isEmpty
                                                ? 'Password must be valid'
                                                : null,
                                        decoration: InputDecoration(
                                            labelText: 'Password',
                                            hintText: 'Enter password',
                                            prefixIcon: const Icon(Icons.lock),
                                            suffixIcon: InkWell(
                                              onTap: () =>
                                                  _obscurePassword.value =
                                                      !_obscurePassword.value,
                                              child: value
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility),
                                            ),
                                            border: const OutlineInputBorder()),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: _emailCtrl,
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: _emailFocus,
                                    readOnly: loginController.state
                                        is AuthStateLoading,
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'Email must be valid'
                                            : null,
                                    decoration: const InputDecoration(
                                        labelText: 'Email',
                                        hintText: 'Enter your email',
                                        prefixIcon: Icon(Icons.email),
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  AppColors.backgroundColor)),
                                      onPressed: loginController.state
                                              is AuthStateLoading
                                          ? null
                                          : () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                final user = User(
                                                    username:
                                                        _usernameCtrl.text,
                                                    password:
                                                        _passwordCtrl.text,
                                                    email: _emailCtrl.text);

                                                Provider.of<UserController>(
                                                        context,
                                                        listen: false)
                                                    .singUp(user);
                                              }
                                            },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: AppColors.textColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Divider(color: AppColors.backgroundColor),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: loginController.state
                                              is AuthStateLoading
                                          ? null
                                          : () => Navigator.pop(context, {
                                                'username': _usernameCtrl.text,
                                                'password': _passwordCtrl.text
                                              }),
                                      child: const Text(
                                        'Or Log In',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
