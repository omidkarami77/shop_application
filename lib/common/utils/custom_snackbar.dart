import 'package:flutter/material.dart';

class CustomSnackbar {
  static showSnack(context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(),
        ),
      ),
    );
  }
}
