import 'package:flutter/material.dart';
import 'package:quiz_app/screens/ScoreScreen/score_option.dart';
import 'package:quiz_app/utils/answer.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class ScoreDetails extends StatelessWidget {
  const ScoreDetails(
      {Key? key,
      required this.selectedCategoryID,
      required this.scoreInPercentage,
      required this.correctAnswers,
      required this.totalQuestionsInQuizLength,
      required this.onHideScores,
      required this.answers})
      : super(key: key);

  final String selectedCategoryID;
  final int scoreInPercentage;
  final List<Answer> correctAnswers;
  final List<Answer> answers;
  final int totalQuestionsInQuizLength;
  final Function() onHideScores;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: myColors['white'],
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Overall: ${scoreInPercentage < 0 ? 0 : scoreInPercentage}%',
                          size: 20,
                          weight: FontWeight.w600,
                          color: myColors['h1Clr'],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: myColors['h1Clr'],
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                            ),
                            children: [
                              const TextSpan(text: 'Selected '),
                              TextSpan(
                                text: '${correctAnswers.length} ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              const TextSpan(text: 'correct options out of '),
                              TextSpan(
                                text: '$totalQuestionsInQuizLength ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              const TextSpan(text: 'questions'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: onHideScores,
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFFEBEDEF),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.close_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              CustomText(
                'Scores',
                size: 20,
                weight: FontWeight.w500,
                color: myColors['h1Clr'],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: answers
                      .asMap()
                      .map((
                        index,
                        ans,
                      ) =>
                          MapEntry(
                              index,
                              Score(
                                index: index + 1,
                                isCorrectAnswer: ans.isCorrectAnswer,
                                questionTxt: ans.questionTxt,
                                selectedOption: ans.selectedOptionValue,
                                selectedOptionLabel:
                                    ans.selectedOptionLabel.toUpperCase(),
                                correctOption: ans.correctOptionValue,
                                correctOptionLabel:
                                    ans.correctOptionLabel.toUpperCase(),
                              )))
                      .values
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Score extends StatelessWidget {
  const Score({
    Key? key,
    required this.selectedOptionLabel,
    required this.index,
    required this.selectedOption,
    required this.correctOptionLabel,
    required this.correctOption,
    required this.isCorrectAnswer,
    required this.questionTxt,
  }) : super(key: key);

  final String selectedOptionLabel;
  final String selectedOption;
  final String correctOptionLabel;
  final String correctOption;
  final String questionTxt;
  final int index;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              '$index',
              weight: FontWeight.w500,
              size: 16,
              color: myColors['h1Clr'],
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    questionTxt,
                    weight: FontWeight.w400,
                    size: 16,
                    color: myColors['text'],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 16,
                    spacing: 16,
                    children: <Widget>[
                      ScoreOption(
                        optionLabel: selectedOptionLabel,
                        optionValue: selectedOption,
                        isCorrectOption: isCorrectAnswer,
                        tag: 'Your Answer',
                      ),
                      !isCorrectAnswer
                          ? ScoreOption(
                              optionLabel: correctOptionLabel,
                              optionValue: correctOption,
                              tag: 'Correct Answer:',
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        const Divider(),
      ],
    );
  }
}
