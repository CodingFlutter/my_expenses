import 'package:flutter/material.dart';

class AddedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Image.asset('assets/images/pic3.png'),
    );
  }
}
