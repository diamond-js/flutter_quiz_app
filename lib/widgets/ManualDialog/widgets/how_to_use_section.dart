import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/ManualDialog/widgets/highlighted_text.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class HowToUseSection extends StatelessWidget {
  const HowToUseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          'Click on start quiz, then select a category then confirm category. To move to next question click the next/skip button or use any of the respective keyboard shortcuts below. The progress bar show how much time you have left to answer all the questions. Once the progress bar is completed, the quiz would end automatically.',
          size: 16,
          color: myColors['text'],
        ),
        const SizedBox(height: 12),
        CustomText(
          'Keyboard Shortcuts',
          size: 18,
          weight: FontWeight.w500,
          color: myColors['h1Clr'],
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: myColors['text'],
              fontSize: 16,
              fontFamily: 'Inter',
            ),
            children: [
              const TextSpan(
                text: 'Press ',
              ),
              const HighlightedText('n').inlineText(),
              const TextSpan(
                text: ', ',
              ),
              const HighlightedText('left arrow').inlineText(),
              const TextSpan(
                text: ' or ',
              ),
              const HighlightedText('Enter').inlineText(),
              const TextSpan(
                text: ' to skip or move to next question.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: myColors['text'],
              fontSize: 16,
              fontFamily: 'Inter',
            ),
            children: [
              const TextSpan(
                text: 'Press ',
              ),
              const HighlightedText('q').inlineText(),
              const TextSpan(
                text: ' to quit and submit quiz.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: myColors['text'],
              fontSize: 16,
              fontFamily: 'Inter',
            ),
            children: [
              const TextSpan(
                text: 'Press ',
              ),
              const HighlightedText('a').inlineText(),
              const TextSpan(text: ' '),
              const HighlightedText('b').inlineText(),
              const TextSpan(text: ' '),
              const HighlightedText('c').inlineText(),
              const TextSpan(text: ' '),
              const HighlightedText('d').inlineText(),
              const TextSpan(
                text: ' to select options respectively.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
