// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../costum.dart';
import '../widget/chatmessage.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHATT'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Chatmessage();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: colorWrite)),
                  suffixIcon: Icon(Icons.send)),
            ),
          ),
        ],
      ),
    );
  }
}
