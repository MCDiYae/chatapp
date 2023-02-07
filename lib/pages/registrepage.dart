import 'package:flutter/material.dart';

import '../costum.dart';
import '../widget/costumbotton.dart';
import '../widget/richtexto.dart';
import '../widget/textfieldform.dart';
import '../widget/texto.dart';

class RegitrePage extends StatelessWidget {
  const RegitrePage({super.key});
  static String id = 'RegistrePage';
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
                Texto(title: sign),
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
            const CostumBotton(
              name: 'SignUP',
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: RichTextLogin(
                keyy: keySign,
                value: valueSign,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
