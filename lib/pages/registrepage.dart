// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../costum.dart';
import '../widget/costumbotton.dart';
import '../widget/richtexto.dart';
import '../widget/snackbar.dart';
import '../widget/textfieldform.dart';
import '../widget/texto.dart';

class RegitrePage extends StatefulWidget {
  const RegitrePage({super.key});
  static String id = 'RegistrePage';

  @override
  State<RegitrePage> createState() => _RegitrePageState();
}

class _RegitrePageState extends State<RegitrePage> {
  String? email;

  String? pass;

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      if (_formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {}); // change UI
                        try {
                          //refactor code (Ctrl+Shift+R).
                          await registration();
                          showErrors(context, 'succes');
                          //apres l'enregistrement avec succes on passe a page chat
                        } on FirebaseAuthException catch (e) {
                          showErrors(context, e.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      }
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
        ),
      ),
    );
  }

  Future<void> registration() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: pass!);
  }
}
