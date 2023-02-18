// ignore_for_file: use_build_context_synchronously

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
import 'chatpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static String id = 'HomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? email, pass;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    onchange: (data) {
                      email = data;
                    },
                    hinttexte: 'Email',
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
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {}); // change UI
                        try {
                          //refactor code (Ctrl+Shift+R).
                          await loginUser();
                          showErrors(context, 'succes');
                          Navigator.pushNamed(context, ChatPage.id,arguments: email);
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
                      } else {}
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
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: pass!);
  }
}
