import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/answer.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/Btn.dart';
import 'package:quiz_app/widgets/HowToUse.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class ScoreOverview extends StatelessWidget {
  const ScoreOverview(
      {Key? key,
      required this.selectedCategoryID,
      required this.scoreInPercentage,
      required this.correctAnswers,
      required this.totalQuestionsInQuizLength,
      required this.onShowScores})
      : super(key: key);

  final String selectedCategoryID;
  final int scoreInPercentage;
  final List<Answer> correctAnswers;
  final int totalQuestionsInQuizLength;
  final Function() onShowScores;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: myColors['white'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            'Result: ${scoreInPercentage < 0 ? 0 : scoreInPercentage}%',
            size: 24,
            weight: FontWeight.w600,
            color: myColors['h1Clr'],
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: myColors['h1Clr'],
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
              children: [
                const TextSpan(text: 'Selected '),
                TextSpan(
                  text: '${correctAnswers.length} ',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const TextSpan(text: 'correct options out of '),
                TextSpan(
                  text: '$totalQuestionsInQuizLength ',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const TextSpan(text: 'questions'),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Btn(
            'Retry',
            () => Get.offAndToNamed('/takequiz/$selectedCategoryID'),
          ),
          const SizedBox(
            height: 16,
          ),
          const HowToUse(),
          const SizedBox(
            height: 24,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Btn(
            'Go Back Home',
            () => Get.toNamed('/'),
            outlined: true,
          ),
          const SizedBox(
            height: 16,
          ),
          Btn('View Scores', onShowScores),
        ],
      ),
    );
  }
}
