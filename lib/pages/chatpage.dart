// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../costum.dart';
import '../models/message.dart';
import '../widget/chatmessage.dart';
import '../widget/chatmessagefr.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  CollectionReference messagi =
      FirebaseFirestore.instance.collection(keyColMessage);

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messagi
            .orderBy(
              mesgTime,
            )
            .snapshots(), // read
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

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
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          ListView.builder(
                            //reverse: true,
                            shrinkWrap: true,
                            itemCount: messagelist.length,
                            itemBuilder: (context, index) {
                              return messagelist[index].id == email
                                  ? Chatmessage(
                                      messag: messagelist[index],
                                    )
                                  : ChatmessageFr(
                                      messag: messagelist[index],
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (data) {
                        messagi.add({
                          keyColMessage: data,
                          mesgTime: DateTime.now(),
                          'id': email,
                        });
                        _controller.clear();
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: colorWrite),
                        ),
                        suffixIcon: const Icon(Icons.send),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('Loading...');
          }
        });
  }
}
