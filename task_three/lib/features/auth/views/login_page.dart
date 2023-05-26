import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _userFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.supervised_user_circle_rounded,
                  size: 200,
                  color: Colors.white,
                ),
                Card(
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
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
                                border: OutlineInputBorder()),
                          ),
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
                                    border: const OutlineInputBorder()),
                              );
                            },
                          ),
                        ],
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
