import 'package:flutter/material.dart';

import '../costum.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            Image.asset('assets/images/scholar.png'),
            Text(
              'chatt',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class Texto extends StatelessWidget {
  const Texto({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      // style: TextStyle(fontSize: 28, fontFamily: 'pacifico', color: colorWrite),
    );
  }
}
