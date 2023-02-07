import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../costum.dart';
import '../widget/costumbotton.dart';
import '../widget/richtexto.dart';
import '../widget/textfieldform.dart';
import '../widget/texto.dart';

class RegitrePage extends StatelessWidget {
  RegitrePage({super.key});
  static String id = 'RegistrePage';
  String? email;
  String? pass;

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
                  Texto(title: sign),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldForm(
                hinttexte: 'Email',
                onchange: (data) {
                  email = data;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldForm(
                hinttexte: 'Password',
                onchange: (data) {
                  pass = data;
                },
              ),
              const SizedBox(
                height: 64,
              ),
              CostumBotton(
                name: 'SignUP',
                onTap: () async {
                  try {
                    //refactor code (Ctrl+Shift+R).
                    await registration();
                  } on FirebaseAuthException catch (e) {
                    showErrors(context, e.toString());
                  }
                  showErrors(context, 'Create with succes');
                },
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
      ),
    );
  }

  void showErrors(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      //show error to users
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registration() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: pass!);
  }
}
