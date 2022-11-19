import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText(this.text, {Key? key}) : super(key: key);

  final String text;

  WidgetSpan inlineText() {
    return WidgetSpan(
      child: UnconstrainedBox(
        child: HighlightedText(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFeff3f6),
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomText(
        text,
        size: 16,
        color: const Color(0xFF386189),
      ),
    );
  }
}
