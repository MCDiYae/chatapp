import 'package:flutter/material.dart';

import '../costum.dart';

class Texto extends StatelessWidget {
  const Texto({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 28, fontFamily: 'Pacifico', color: colorWrite),
    );
  }
}
