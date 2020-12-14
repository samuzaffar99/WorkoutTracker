import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String resclr;
  final Function selector;

  Result(this.resclr, this.selector);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(resclr),
        onPressed: selector,
      ),
    );
  }
}
