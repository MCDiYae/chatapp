
import 'package:flutter/material.dart';

import '../costum.dart';

class RichTextLogin extends StatelessWidget {
  const RichTextLogin({
    super.key,
    required this.keyy,
    required this.value, 
  });
  final String keyy;
  final String value;
  

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
          TextSpan(
            text: keyy,
            style: TextStyle(color: colorWrite, fontSize: 18),
          ),
          TextSpan(
              text: value,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,),
             
              
                  ),
        ]
        ));
  }
}
