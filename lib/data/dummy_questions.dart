import '../models/question.dart';

const List<Question> dummyQuestions = [
  Question(
    text: 'Bahasa pemrograman apa yang digunakan oleh Flutter?',
    options: ['Kotlin', 'Swift', 'Dart', 'Java'],
    correctIndex: 2,
  ),
  Question(
    text: 'Widget yang tampilannya tidak berubah setelah dibuat disebut...',
    options: [
      'StatefulWidget',
      'InheritedWidget',
      'StatelessWidget',
      'ChangeNotifier',
    ],
    correctIndex: 2,
  ),
  Question(
    text: 'Method apa yang dipakai untuk memperbarui tampilan pada StatefulWidget?',
    options: ['build()', 'initState()', 'dispose()', 'setState()'],
    correctIndex: 3,
  ),
  Question(
    text: 'Widget yang menyusun children secara horizontal adalah...',
    options: ['Row', 'Column', 'Stack', 'Container'],
    correctIndex: 0,
  ),
  Question(
    text: 'File yang digunakan untuk mendaftarkan dependency dan aset di Flutter adalah...',
    options: [
      'main.dart',
      'analysis_options.yaml',
      'pubspec.yaml',
      'build.gradle',
    ],
    correctIndex: 2,
  ),
  Question(
    text: 'Package state management yang memakai ChangeNotifier adalah...',
    options: ['http', 'Provider', 'sqflite', 'flutter_svg'],
    correctIndex: 1,
  ),
  Question(
    text: 'Perintah untuk menjalankan aplikasi Flutter adalah...',
    options: [
      'flutter create',
      'flutter clean',
      'flutter build',
      'flutter run',
    ],
    correctIndex: 3,
  ),
  Question(
    text: 'Widget untuk menampilkan gambar dari folder aset adalah...',
    options: ['Image.network', 'Image.file', 'Image.asset', 'Icon'],
    correctIndex: 2,
  ),
];
