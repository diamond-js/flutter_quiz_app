import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/utils/func.dart';

class LearnMoreTooltip extends StatelessWidget {
  final Function()? onClose;
  const LearnMoreTooltip({
    Key? key,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: myColors['white'],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Reactjs Quiz App',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E3A4C),
                ),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: onClose,
                child: const Icon(
                  Icons.close_rounded,
                  size: 24,
                  color: Color(0xFF2E3A4C),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () => openManualDialog(openAboutAsActiveNav: true),
            child: const Text(
              'Learn More',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF336FC8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
