import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isMaxLin;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.isMaxLin = false,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      controller: controller,
      obscureText: obscureText,
      maxLines: isMaxLin ? 6 : null,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(.8)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(.8)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.8)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(.8)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8), // Glassmorphism input field
      ),
    );
  }
}
