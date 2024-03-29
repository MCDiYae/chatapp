
import 'package:flutter/material.dart';


import '../costum.dart';
import '../models/message.dart';

class ChatmessageFr extends StatelessWidget {
  const ChatmessageFr({super.key, required this.messag});
  final Message messag;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: pPremuimC3,
        ),
        child: Text(
          messag.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}