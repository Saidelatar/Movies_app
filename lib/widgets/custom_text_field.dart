import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  Widget? suffixIcon;
  bool obscureText;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  TextEditingController? controller;

  CustomTextField(
      {super.key,
      required this.hint,
      this.suffixIcon,
      this.obscureText = false,
      this.onChanged,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) return ('field is required');
      },
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        hintText: hint,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
