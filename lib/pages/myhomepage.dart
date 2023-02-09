import 'package:chatapp/pages/registrepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../costum.dart';
import '../widget/costumbotton.dart';
import '../widget/richtexto.dart';
import '../widget/snackbar.dart';
import '../widget/textfieldform.dart';
import '../widget/texto.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  static String id = 'HomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: Column(
                key: _formKey,
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
                    name: 'LOGIN',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {}); // change UI
                        try {
                          //refactor code (Ctrl+Shift+R).
                          await loginUser();
                          showErrors(context, 'succes');
                          //apres l'enregistrement avec succes on passe a page chat
                          //: ..
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showErrors(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showErrors(context,
                                'Wrong password provided for that user.');
                          }
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user =
        await auth.signInWithEmailAndPassword(email: email!, password: pass!);
  }
}
