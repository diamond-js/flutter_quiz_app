import 'package:get/get.dart';
import 'package:quiz_app/utils/answer.dart';

class AnswerController extends GetxController {
  RxList<Answer> answers = <Answer>[].obs;

  void saveAnswer(Answer ans) {
    answers.add(ans);
    // answers = [...answers, ans].obs;
  }
}
