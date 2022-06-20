import 'package:flutter/material.dart';

class AddedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      width: MediaQuery.of(context).size.width * 0.37,
      child: Image.asset('assets/images/pic3.png'),
    );
  }
}
