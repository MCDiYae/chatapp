import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  TextFieldForm({
    super.key,
    this.hinttexte,
  });
  String? hinttexte;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
