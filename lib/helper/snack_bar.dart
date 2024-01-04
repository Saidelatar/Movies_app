import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      content: Text(message),
    ),
  );
}
