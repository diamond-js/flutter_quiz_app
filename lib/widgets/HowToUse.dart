import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/utils/func.dart';
import 'package:quiz_app/widgets/ManualDialog/ManualDialog.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openManualDialog(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'How to use',
            style: TextStyle(color: myColors['grayTxt'], fontSize: 14),
          ),
          const SizedBox(width: 3),
          SizedBox(
            width: 14,
            height: 14,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color(0xFFCEDAE6),
                  borderRadius: BorderRadius.circular(14)),
              child: const Icon(
                Icons.question_mark_rounded,
                size: 10,
                color: Color(0xFF1678DB),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
