import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/pages/myhomepage.dart';
import 'package:chatapp/pages/registrepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChatPage.id: (context) => ChatPage(),
      },
      title: 'IG app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'HomePage',
    );
  }
}
