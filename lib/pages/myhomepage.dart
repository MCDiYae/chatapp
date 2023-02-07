import 'package:chatapp/pages/registrepage.dart';
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
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
        child: SingleChildScrollView(
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
                height: 64,
              ),
               CostumBotton(
                name: 'LOGIN',
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegitrePage.id);
                },
                child: RichTextLogin(
                  keyy: keyLogin,
                  value: valueLogin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
