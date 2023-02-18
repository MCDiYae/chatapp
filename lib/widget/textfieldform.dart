import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  TextFieldForm(
      {super.key,
      required this.hinttexte,
      this.onchange,
      this.obscurText = false});
  final String hinttexte;
  Function(String)? onchange;
  bool? obscurText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurText!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a value';
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
          hintText: hinttexte,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
