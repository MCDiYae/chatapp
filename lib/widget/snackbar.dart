  import 'package:flutter/material.dart';

void showErrors(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      //show error to users
      SnackBar(
        content: Text(message),
      ),
    );
  }