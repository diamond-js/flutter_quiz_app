import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: myColors['bgGray'],
      alignment: Alignment.center,
      padding: const EdgeInsets.all(30),
      child: child,
    );
  }
}

class WrapperContainer extends StatelessWidget {
  final Widget child;
  const WrapperContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 350),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        boxShadow: const [containerShadow],
        color: myColors['white'],
      ),
      child: child,
    );
  }
}
