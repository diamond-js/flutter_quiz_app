import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/utils/quiz_utils.dart';
import 'package:quiz_app/widgets/Btn.dart';
import 'package:quiz_app/widgets/HowToUse.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class ConfirmCategoryScreen extends StatelessWidget {
  ConfirmCategoryScreen({super.key});

  final String selectedCategoryID = Get.parameters['categoryID'] ?? '';

  final QuizUtils quizUtils = QuizUtils();

  int get totalLengthOfQuestionsInSelectedCategory => quizUtils
      .getQuestionsWithCategoryID(selectedCategoryID, questions)
      .length;

  Duration get totalDurationOfQuestionsInSelectedCategory =>
      quizUtils.calculateTotalDurationOfQuestions(
          quizUtils.getQuestionsWithCategoryID(selectedCategoryID, questions));

  @override
  Widget build(BuildContext context) {
    final String categoryNameSelected =
        quizUtils.getCategoryNameWithId(selectedCategoryID, categoryList);
    final int totalLengthOfQestions = totalLengthOfQuestionsInSelectedCategory;
    final Duration totalDurationOfQestions =
        totalDurationOfQuestionsInSelectedCategory;
    final int durationInSeconds = totalDurationOfQestions.inSeconds;
    final int durationInMinutes = totalDurationOfQestions.inMinutes;
    final String totalDurationFormattedToString =
        '${durationInMinutes > 0 ? '${durationInMinutes}m ' : ''}${durationInMinutes > 0 || durationInSeconds > 0 ? '${durationInSeconds - (60 * durationInMinutes)}s' : '0m'}';

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: myColors['white'],
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(children: [
          CustomText(
            'Category selected:',
            size: 20,
            weight: FontWeight.w400,
            color: myColors['h1Clr'],
          ),
          const SizedBox(height: 12),
          CustomText(
            categoryNameSelected,
            size: 24,
            weight: FontWeight.w600,
            color: myColors['h1Clr'],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Total Questions',
                    size: 18,
                    weight: FontWeight.w500,
                    color: myColors['h1Clr'],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomText(
                    'Total Time',
                    size: 18,
                    weight: FontWeight.w500,
                    color: myColors['h1Clr'],
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CustomText(
                    '$totalLengthOfQestions', //total questions
                    size: 18,
                    weight: FontWeight.w600,
                    color: myColors['h1Clr'],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomText(
                    totalDurationFormattedToString, //total duration
                    size: 18,
                    weight: FontWeight.w600,
                    color: myColors['h1Clr'],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          totalLengthOfQestions < 1
              ? CustomText(
                  'No questions in this category', //total duration
                  size: 16,
                  weight: FontWeight.w400,
                  color: myColors['errorTxt'],
                )
              : const SizedBox(),
          Btn('Change Category', () => Get.toNamed('category'), outlined: true),
          totalLengthOfQestions < 1
              ? const SizedBox()
              : Btn(
                  'Start Quiz',
                  () => Get.toNamed('/takequiz/$selectedCategoryID'),
                ),
          const SizedBox(height: 25),
          const HowToUse(),
        ]),
      ),
    ));
  }
}
