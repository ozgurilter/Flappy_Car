import 'package:flutter/material.dart';

class Barriers extends StatelessWidget {
  final size;

  Barriers({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
     decoration: BoxDecoration(
       color: Colors.white,
       border: Border.all(width: 10,color: Colors.black),
       borderRadius: BorderRadius.circular(10)
     ),
      child: Image.asset("image/a.png", fit: BoxFit.cover, ),

    );
  }
}
