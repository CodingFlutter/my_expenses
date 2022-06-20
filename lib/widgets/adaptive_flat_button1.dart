import 'package:flutter/material.dart';

class AdaptiveFlatButton1 extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveFlatButton1(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.button,
      ),
      onPressed: handler,
    );
  }
}
