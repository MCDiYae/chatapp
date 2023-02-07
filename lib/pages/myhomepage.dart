import 'package:flutter/material.dart';

import '../costum.dart';
import '../widget/costumbotton.dart';
import '../widget/richtexto.dart';
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
            const SizedBox(
              height: 64,
            ),
            Row(
              children: [
                Texto(title: login),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const TextFieldForm(
              hinttexte: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            const TextFieldForm(
              hinttexte: 'Password',
            ),
            const SizedBox(
              height: 64,
            ),
            const CostumBotton(),
            const SizedBox(
              height: 16,
            ),
            RichTextLogin(
              keyy: keyLogin,
              value: valueLogin,
            ),
          ],
        ),
      ),
    );
  }
}
