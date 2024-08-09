import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:150,
      height: 100,
      child: Image.asset("image/incilogo.jpg"),
    );
  }
}
