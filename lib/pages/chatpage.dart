// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHATT'),
        centerTitle: true,
      ),
    );
  }
}
