import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/ScoreScreen/score_details.dart';
import 'package:quiz_app/screens/ScoreScreen/score_overview.dart';
import 'package:quiz_app/state/controllers/answers_controller.dart';
import 'package:quiz_app/utils/answer.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/utils/question.dart';
import 'package:quiz_app/utils/quiz_utils.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final String selectedCategoryID = Get.parameters['categoryID'] ?? '';
  bool showScores = false;
  final QuizUtils quizUtils = QuizUtils();

// Getx state management
  AnswerController answerController = Get.put(AnswerController());

  void filterScores() {}

  @override
  Widget build(BuildContext context) {
    List<Answer> correctAnswers =
        answerController.answers.where((ans) => ans.isCorrectAnswer).toList();

    int scoreInPercentage =
        ((correctAnswers.length / answerController.answers.length) * 100)
            .toInt();
    List<Question> totalQuestionsInQuiz =
        quizUtils.getQuestionsWithCategoryID(selectedCategoryID, questions);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: myColors['white'],
        padding: const EdgeInsets.all(20),
        child: ScoreOverview(
          scoreInPercentage: scoreInPercentage,
          selectedCategoryID: selectedCategoryID,
          totalQuestionsInQuizLength: totalQuestionsInQuiz.length,
          correctAnswers: correctAnswers,
          onShowScores: () {
            Get.to(
              () => ScoreDetails(
                scoreInPercentage: scoreInPercentage,
                selectedCategoryID: selectedCategoryID,
                totalQuestionsInQuizLength: totalQuestionsInQuiz.length,
                answers: answerController.answers,
                correctAnswers: correctAnswers,
                onHideScores: () {
                  Get.back();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
