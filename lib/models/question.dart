class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  /// Penjelasan tiap opsi, urutannya sama dengan [options].
  /// Isi untuk opsi benar = kenapa benar, untuk opsi lain = kenapa salah.
  final List<String> optionExplanations;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.optionExplanations,
  }) : assert(options.length == optionExplanations.length);
}
