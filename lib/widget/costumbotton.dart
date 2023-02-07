import 'package:flutter/material.dart';

class CostumBotton extends StatelessWidget {
  const CostumBotton({
    super.key, required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      width: double.infinity,
      height: 50,
      child:  Center(
        child: Text(
          name,
          style:const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
