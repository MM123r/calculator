
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class buttom2_widget extends StatelessWidget {
  final String text;
  final Function onTap;

  buttom2_widget({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff4b5efc),
          ),
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25, 
                fontWeight: FontWeight.bold, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}
