
import 'package:flutter/material.dart';

class CostumBotton extends StatelessWidget {
  const CostumBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      width: double.infinity,
      height: 50,
      child: const Center(
        child: Text(
          'login',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
