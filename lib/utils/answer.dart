class Answer {
  final String
      questionTxt; // e.g what is the first element in the periodic table

  final String correctOptionLabel; // e.g a,b,c
  final String selectedOptionLabel; // e.g a,b,c
  final List<Map<String, String>> options;

  bool get isCorrectAnswer => correctOptionLabel == selectedOptionLabel;

  String get correctOptionValue =>
      options.singleWhere(
        (element) => element['label'] == correctOptionLabel,
        orElse: () {
          return {'label': "", 'value': ''};
        },
      )['value'] ??
      ''; // e.g Oxygen

  String get selectedOptionValue =>
      options.singleWhere(
        (element) => element['label'] == selectedOptionLabel,
        orElse: () {
          return {'label': "", 'value': ''};
        },
      )['value'] ??
      ''; //e.g Hydrogen
  const Answer({
    required this.questionTxt,
    this.selectedOptionLabel = '',
    this.correctOptionLabel = '',
    this.options = const [],
  });
}
