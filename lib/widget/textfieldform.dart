import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  TextFieldForm({super.key, 
         required this.hinttexte,this.onchange
  });
 final String hinttexte;
 Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchange ,
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
