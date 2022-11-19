class Question {
  final String question;
  final Duration duration;
  final List<Map<String, String>> options;
  final String currectOption;
  final String category;
  const Question({
    required this.question,
    this.duration = const Duration(),
    required this.options,
    required this.currectOption,
    required this.category,
  });
}
