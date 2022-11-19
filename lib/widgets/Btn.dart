import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class Btn extends StatelessWidget {
  final void Function()? onPressed;
  final bool outlined;
  final String text;
  const Btn(
    this.text,
    this.onPressed, {
    Key? key,
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: outlined ? myColors['white'] : myColors['btnClr'],
          // shape: OutlinedBorder(),
          side: BorderSide(
              width: 1, color: myColors['btnClr'] ?? const Color(0x00000000)),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          )),
      child: CustomText(text,
          color: outlined ? myColors['btnClr'] : myColors['white'],
          size: 16,
          weight: FontWeight.w500),
    );
  }
}
