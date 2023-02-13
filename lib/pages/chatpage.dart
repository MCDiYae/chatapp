// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../costum.dart';
import '../widget/chatmessage.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';
  final TextEditingController _controller = TextEditingController();

  CollectionReference message =
      FirebaseFirestore.instance.collection(keyMessage);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: message.doc('d7cgTzRATSDS78CvHQRc').get(),// read 
      builder: (context, snapshot) {
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
                  controller: _controller,
                  onSubmitted: (data) {
                    message.add({
                      'message': data,
                    });
                    _controller.clear();
                  },
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
      },
    );
  }
}
