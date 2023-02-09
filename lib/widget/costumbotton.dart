import 'package:flutter/material.dart';

class CostumBotton extends StatelessWidget {
  CostumBotton({
    super.key,
    this.onTap,
    required this.name,
  });
  final String name;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
