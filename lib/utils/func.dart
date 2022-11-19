//the files hold most of my utility functions

import 'package:get/get.dart';
import 'package:quiz_app/widgets/ManualDialog/ManualDialog.dart';

void openManualDialog({bool openAboutAsActiveNav = false}) {
  Get.dialog(ManualDialog(
    openAboutAsActiveNav: openAboutAsActiveNav,
  ));
}

List<Map<String, String>> generateOptionsForQuestion(
    String a, String b, String c, String d,
    [List<Map<String, String>> moreOptions = const []]) {
  return [
    {
      'label': 'a',
      'value': a,
    },
    {
      'label': 'b',
      'value': b,
    },
    {
      'label': 'c',
      'value': c,
    },
    {
      'label': 'd',
      'value': d,
    },
    ...moreOptions
  ];
}
