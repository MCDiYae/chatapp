// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../costum.dart';
import '../models/message.dart';
import '../widget/chatmessage.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';
  final TextEditingController _controller = TextEditingController();

  CollectionReference message =
      FirebaseFirestore.instance.collection(keyColMessage);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: message.get(), // read
        builder: (context, snapshot) {
         

          if (snapshot.hasData) {
            List<Message> messagelist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('CHATT'),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: messagelist.length,
                      itemBuilder: (context, index) {
                        return Chatmessage(message:messagelist[index] ,);
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
          } else {
            return Text('loading');
          }
        });
  }
}
