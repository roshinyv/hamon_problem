import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight boldness;
  const AppLargeText(
      {Key? key,
      required this.text,
      this.size = 25,
      this.color = Colors.black,
      this.boldness = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: boldness),
    );
  }
}

class AppSmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight boldness;
  const AppSmallText(
      {Key? key,
      required this.text,
      this.size = 18,
      this.color = Colors.black,
      this.boldness = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: boldness),
    );
  }
}
