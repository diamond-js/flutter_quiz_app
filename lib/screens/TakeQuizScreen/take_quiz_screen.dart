import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/TakeQuizScreen/option.dart';
import 'package:quiz_app/state/controllers/answers_controller.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/Btn.dart';
import 'package:quiz_app/widgets/HowToUse.dart';
import '../../utils/question.dart';
import 'package:quiz_app/utils/quiz_utils.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class TakeQuizScreen extends StatefulWidget {
  const TakeQuizScreen({Key? key}) : super(key: key);

  @override
  _TakeQuizScreenState createState() => _TakeQuizScreenState();
}

class _TakeQuizScreenState extends State<TakeQuizScreen>
    with SingleTickerProviderStateMixin {
  final String selectedCategoryID = Get.parameters['categoryID'] ?? '';
  final QuizUtils quizUtils = QuizUtils();

  List<Question> questionsInSelectedCategory = [];
  int currentQuestionIndex = 0;
  Question? currentQuestionBeingAnswered;
  String selectedOptionLabel = '';

  // Getx state management
  AnswerController answerController = Get.put(AnswerController());

  //animations
  late AnimationController animationController;
  late Animation<double> animation;

  void nextQuestion() {
    answerController.saveAnswer(quizUtils.answerQuestion(
        selectedOptionLabel, currentQuestionBeingAnswered));

    //check if we are at the last question
    if (currentQuestionIndex >= (questionsInSelectedCategory.length - 1)) {
      endQuix();
      return;
    }

    setState(() {
      currentQuestionIndex++;
      currentQuestionBeingAnswered =
          questionsInSelectedCategory[currentQuestionIndex];
      selectedOptionLabel = '';
    });
  }

  void selectOption(String label) {
    setState(() {
      selectedOptionLabel == label
          ? selectedOptionLabel = ''
          : selectedOptionLabel = label;
    });
  }

  void endQuix() {
    Get.offAndToNamed('/scores/$selectedCategoryID');
  }

  @override
  void initState() {
    super.initState();
    // final dur = const Duration(seconds: 40) + const Duration(seconds: 10);
    // log('this is dur; sec:  ${dur.inSeconds}, calc min: ${dur.inSeconds / 60} , calc sec: ${dur.inSeconds - 60} , min:  ${dur.inMinutes} :: $dur');

    setState(() {
      questionsInSelectedCategory =
          quizUtils.getQuestionsWithCategoryID(selectedCategoryID, questions);

      if (questionsInSelectedCategory.isNotEmpty) {
        currentQuestionBeingAnswered =
            questionsInSelectedCategory[currentQuestionIndex];
      }

      animationController = AnimationController(
          vsync: this,
          duration: quizUtils
              .calculateTotalDurationOfQuestions(questionsInSelectedCategory));
      animation = Tween<double>(begin: 0, end: 1.0).animate(animationController)
        ..addListener(() => setState(() {}))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) endQuix();
        });
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> optionsForCurrentQuestion =
        currentQuestionBeingAnswered?.options.map((option) {
              final label = option['label'] ?? '';
              final value = option['value'] ?? '';
              return Column(
                children: [
                  Option(
                    optionLabel: label,
                    optionValue: value,
                    selected: selectedOptionLabel == label,
                    onSelect: () => selectOption(label),
                  ),
                  const SizedBox(
                    height: 36,
                  )
                ],
              );
            }).toList() ??
            [];

    bool isLastQuestion =
        currentQuestionIndex >= questionsInSelectedCategory.length - 1;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: myColors['white'],
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: questionsInSelectedCategory.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          'No questions found in ${quizUtils.getCategoryNameWithId(selectedCategoryID, categoryList)} category',
                          size: 18,
                          color: myColors['errorTxt'],
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Btn(
                          'Change category',
                          () => Get.toNamed('category'),
                          outlined: true,
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CustomText(
                            '${currentQuestionIndex + 1} of ${questionsInSelectedCategory.length}',
                            size: 18,
                            weight: FontWeight.w600,
                            color: const Color(0xFF38404C),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Question',
                                  size: 18,
                                  weight: FontWeight.w600,
                                  color: myColors['h1Clr'],
                                ),
                                const SizedBox(height: 12),
                                CustomText(
                                  currentQuestionBeingAnswered?.question ?? '',
                                  size: 18,
                                  weight: FontWeight.w400,
                                  color: myColors['text'],
                                ),
                                const SizedBox(height: 32),
                                CustomText(
                                  'Options',
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: myColors['h1Clr'],
                                ),
                                const SizedBox(height: 16),
                                ...optionsForCurrentQuestion,
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const HowToUse(),
                              Btn(
                                isLastQuestion
                                    ? 'Finish'
                                    : (selectedOptionLabel.isNotEmpty
                                        ? 'Next'
                                        : 'Skip'),
                                () => nextQuestion(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: FractionallySizedBox(
                  widthFactor: animation.value,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(color: myColors['prim']),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
