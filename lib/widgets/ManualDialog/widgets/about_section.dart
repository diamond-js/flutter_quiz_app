import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/ManualDialog/widgets/highlighted_text.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final techUsed = technologiesUsedInApp.map((txt) {
      return UnconstrainedBox(child: HighlightedText(txt));
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: myColors['text'],
              fontSize: 16,
              fontFamily: 'Inter',
            ),
            children: [
              const TextSpan(
                text: 'This is a Quiz app designed and programmed by ',
              ),
              const HighlightedText('Dynasty Aigbomian').inlineText(),
              const TextSpan(
                text: ' as a flutter project.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        CustomText(
          'Technologies Used',
          size: 18,
          weight: FontWeight.w500,
          color: myColors['h1Clr'],
        ),
        const SizedBox(height: 8),
        DefaultTextStyle(
          style: TextStyle(color: myColors['text'], fontSize: 16),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: techUsed,
          ),
        ),
        const SizedBox(height: 16),
        CustomText(
          'Follow Me',
          size: 18,
          weight: FontWeight.w500,
          color: myColors['h1Clr'],
        ),
      ],
    );
  }
}
