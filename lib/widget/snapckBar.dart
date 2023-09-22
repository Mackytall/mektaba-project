import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context, Color backgroundColor, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      duration: Duration(milliseconds: 1300),
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
