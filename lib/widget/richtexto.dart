
import 'package:flutter/material.dart';

import '../costum.dart';

class RichTextLogin extends StatelessWidget {
  const RichTextLogin({
    super.key,
    required this.keyy,
    required this.value, required this.destination,
  });
  final String keyy;
  final String value;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: RichText(
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
          )),
    );
  }
}
