import 'package:flutter/material.dart';

class Color extends StatelessWidget {
  final String colortext;

  Color(this.colortext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        colortext,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
