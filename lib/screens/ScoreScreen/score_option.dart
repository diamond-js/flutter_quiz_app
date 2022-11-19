import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class ScoreOption extends StatelessWidget {
  const ScoreOption(
      {Key? key,
      required this.optionLabel,
      required this.optionValue,
      this.isCorrectOption = true,
      this.tag = ''})
      : super(key: key);

  final String optionValue;
  final String optionLabel;
  final String tag;
  final bool isCorrectOption;

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        isCorrectOption ? const Color(0xFF12AF8A) : const Color(0xFFF97F7F);
    return Column(
      crossAxisAlignment: optionLabel.isEmpty || optionValue.isEmpty
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          tag,
          weight: FontWeight.w500,
          size: 12,
          color: myColors['h1Clr'],
        ),
        const SizedBox(height: 8),
        if (optionLabel.isEmpty || optionValue.isEmpty)
          Container(
            width: 28,
            height: 4,
            decoration: BoxDecoration(
                color: const Color(0xFFF2AA55),
                borderRadius: BorderRadius.circular(9)),
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(14)),
                child: CustomText(
                  optionLabel,
                  weight: FontWeight.w500,
                  color: myColors['white'],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(4)),
                child: CustomText(
                  optionValue,
                  weight: FontWeight.w500,
                  color: myColors['white'],
                ),
              ),
            ],
          )
      ],
    );
  }
}
