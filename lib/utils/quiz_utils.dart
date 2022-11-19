import 'package:quiz_app/utils/answer.dart';

import 'package:quiz_app/utils/question.dart';

class QuizUtils {
  List<Question> getQuestionsWithCategoryID(
      String catgoryID, List<Question> questionsToSearch) {
    return questionsToSearch
        .where((element) => element.category == catgoryID)
        .toList();
  }

  Duration calculateTotalDurationOfQuestions(List<Question> questionsToSearch) {
    if (questionsToSearch.isEmpty) return const Duration();
    return questionsToSearch.fold(
      const Duration(),
      (value, element) {
        return value + element.duration;
      },
    );
  }

  String getCategoryNameWithId(
      String categoryId, List<Map<String, String>> listOfCategory) {
    return listOfCategory.singleWhere(
          (element) => element['id'] == categoryId,
          orElse: () => {},
        )['name'] ??
        '';
  }

  Answer answerQuestion(selectedOptionLabel, Question? question) {
    final String correctOption = question?.currectOption ?? '';

    return Answer(
      questionTxt: question?.question ?? '',
      correctOptionLabel: correctOption,
      selectedOptionLabel: selectedOptionLabel,
      options: question?.options ?? [],
    );
  }
}
