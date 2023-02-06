import 'package:flutter/material.dart';

import '../costum.dart';
import '../widget/textfieldform.dart';
import '../widget/texto.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
        child: Column(
          children: [
            Image.asset('assets/images/scholar.png'),
            Texto(title: title1),
            const Texto(title: 'login'),
            TextFieldForm(
              hinttexte: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldForm(
              hinttexte: 'Password',
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              height: 50,
              child: const Center(
                child: Text(
                  'login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
