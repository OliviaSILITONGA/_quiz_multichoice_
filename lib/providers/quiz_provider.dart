import 'package:flutter/material.dart';

import '../data/dummy_questions.dart';
import '../models/question.dart';

class QuizProvider extends ChangeNotifier {
  final List<Question> _questions = dummyQuestions;
  final Map<int, int> _answers = {}; // index soal -> index jawaban

  String _userName = '';
  int _currentIndex = 0;
  bool _started = false;
  bool _finished = false;

  // GETTER
  String get userName => _userName;
  List<Question> get questions => _questions;

  /// Jawaban user untuk soal ke-[questionIndex] (null jika belum dijawab).
  int? answerAt(int questionIndex) => _answers[questionIndex];
  int get currentIndex => _currentIndex;
  int get totalQuestions => _questions.length;
  Question get currentQuestion => _questions[_currentIndex];
  bool get isFirstQuestion => _currentIndex == 0;
  bool get isLastQuestion => _currentIndex == _questions.length - 1;
  int? get selectedAnswer => _answers[_currentIndex];
  bool get hasAnswered => _answers.containsKey(_currentIndex);
  int get answeredCount => _answers.length;
  bool get hasProgress => _started && !_finished;

  int get correctCount {
    var count = 0;
    _answers.forEach((questionIndex, answerIndex) {
      if (_questions[questionIndex].correctIndex == answerIndex) count++;
    });
    return count;
  }

  int get score => (correctCount / totalQuestions * 100).round();

  // ACTIONS
  void startQuiz(String name) {
    _userName = name.trim();
    _answers.clear();
    _currentIndex = 0;
    _started = true;
    _finished = false;
    notifyListeners();
  }

  void selectAnswer(int answerIndex) {
    _answers[_currentIndex] = answerIndex;
    notifyListeners();
  }

  void next() {
    if (!isLastQuestion) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previous() {
    if (!isFirstQuestion) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void finish() {
    _finished = true;
    notifyListeners();
  }
}
