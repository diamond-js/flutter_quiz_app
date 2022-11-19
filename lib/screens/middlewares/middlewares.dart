import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/utils/quiz_utils.dart';

// checks weather selected category exists
class ConfirmCategoryGuard extends GetMiddleware {
  String getSelectedCategoryById(categoryID) {
    return categoryList.singleWhere((element) => element['id'] == categoryID,
            orElse: () {
          return {};
        })['id'] ??
        '';
  }

  bool checkIsCategoryFound(String categoryID) {
    if (categoryID.isEmpty) return false;
    return getSelectedCategoryById(categoryID).isNotEmpty;
  }

  @override
  RouteSettings? redirect(String? route) {
    if (!checkIsCategoryFound(Get.parameters['categoryID'] ?? '')) {
      return const RouteSettings(name: '/');
    }

    return null;
  }
}

// checks weather selected category exists
class TakeQuizGuard extends GetMiddleware {
  final QuizUtils quizUtils = QuizUtils();
  @override
  RouteSettings? redirect(String? route) {
    final selectedCategoryID = Get.parameters['categoryID'] ?? '';
    final questionsInSelectedCategory =
        quizUtils.getQuestionsWithCategoryID(selectedCategoryID, questions);

    if (questionsInSelectedCategory.isEmpty) {
      return const RouteSettings(name: '/');
    }

    final totalDuration = quizUtils
        .calculateTotalDurationOfQuestions(questionsInSelectedCategory);

    if (totalDuration.inSeconds < 1) {
      // log('no duration');
      Get.snackbar(
        'Quiz Ended',
        'No question or quiz duration available',
      );
      return const RouteSettings(name: '/');
    }

    return null;
  }
}
