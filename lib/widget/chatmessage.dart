import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';

import '../costum.dart';

class Chatmessage extends StatelessWidget {
  const Chatmessage({super.key, required this.messag});
  final Message messag;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: pPremuimCl,
        ),
        child: Text(
          messag.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
