import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String family;
  final double size;
  final Color? color;
  final FontWeight weight;
  final TextStyle otherStyles;

  final TextAlign textAlign;

  const CustomText(this.text,
      {Key? key,
      this.size = 14,
      this.weight = FontWeight.w400,
      this.color = Colors.black,
      this.otherStyles = const TextStyle(),
      this.textAlign = TextAlign.left,
      this.family = 'Inter'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: weight,
              fontFamily: family)
          .merge(otherStyles),
      textAlign: textAlign,
    );
  }
}
