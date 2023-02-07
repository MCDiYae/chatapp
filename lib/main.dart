import 'package:chatapp/pages/myhomepage.dart';
import 'package:chatapp/pages/registrepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.id: (context) => const MyHomePage(),
        RegitrePage.id: (context) => const RegitrePage(),
      },
      title: 'IG app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'HomePage',
    );
  }
}
