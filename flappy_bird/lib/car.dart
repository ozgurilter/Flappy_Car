import 'package:flutter/material.dart';

class Car extends StatelessWidget {
  const Car({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Image.asset("image/cargame.jpeg"),
    );
  }
}
