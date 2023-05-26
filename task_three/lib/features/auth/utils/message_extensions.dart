import 'package:flutter/material.dart';

extension MessageExtension on BuildContext {
  void showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
