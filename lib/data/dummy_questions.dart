import '../models/question.dart';

List<Question> dummyQuestions = [
  Question(
    text: 'Bahasa pemrograman apa yang digunakan oleh Flutter?',
    options: ['Kotlin', 'Swift', 'Dart', 'Java'],
    correctIndex: 2,
    optionExplanations: [
      'Kotlin dipakai untuk pengembangan Android native, bukan bahasa yang dipakai Flutter.',
      'Swift dipakai untuk pengembangan iOS native, bukan Flutter.',
      'Flutter ditulis dengan bahasa Dart buatan Google, sehingga satu kode bisa berjalan di banyak platform.',
      'Java memang dipakai untuk Android native, tetapi Flutter tidak memakainya sebagai bahasa utama.',
    ],
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
    optionExplanations: [
      'StatefulWidget justru punya State yang bisa berubah, dan tampilannya diperbarui lewat setState().',
      'InheritedWidget dipakai untuk membagikan data ke widget di bawahnya dalam widget tree, bukan penanda widget yang tidak berubah.',
      'StatelessWidget tidak menyimpan state yang berubah; tampilannya hanya ditentukan oleh data yang diberikan saat dibuat.',
      'ChangeNotifier adalah class untuk memberi tahu listener saat data berubah (dipakai di Provider), bukan jenis widget.',
    ],
  ),
  Question(
    text: 'Method apa yang dipakai untuk memperbarui tampilan pada StatefulWidget?',
    options: ['build()', 'initState()', 'dispose()', 'setState()'],
    correctIndex: 3,
    optionExplanations: [
      'build() bertugas menggambar UI, tetapi tidak dipanggil manual untuk meminta pembaruan tampilan.',
      'initState() hanya dipanggil sekali saat State pertama dibuat, untuk inisialisasi awal.',
      'dispose() dipanggil saat State dihapus, dipakai untuk melepas resource seperti controller.',
      'setState() memberi tahu Flutter bahwa data berubah, sehingga build() dijalankan ulang dan tampilan diperbarui.',
    ],
  ),
  Question(
    text: 'Widget yang menyusun children secara horizontal adalah...',
    options: ['Row', 'Column', 'Stack', 'Container'],
    correctIndex: 0,
    optionExplanations: [
      'Row menyusun children dari kiri ke kanan, yaitu secara horizontal.',
      'Column menyusun children dari atas ke bawah (vertikal), kebalikan dari Row.',
      'Stack menumpuk children di atas satu sama lain, bukan menyusunnya berderet.',
      'Container adalah pembungkus untuk padding, warna, dan ukuran, bukan untuk menyusun banyak children secara horizontal.',
    ],
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
    optionExplanations: [
      'main.dart adalah titik awal program (fungsi main), bukan tempat mendaftarkan dependency.',
      'analysis_options.yaml mengatur aturan analisis kode (lint), bukan dependency atau aset.',
      'pubspec.yaml berisi metadata proyek, dependency, aset, dan font yang dipakai aplikasi.',
      'build.gradle adalah konfigurasi build khusus Android, bukan tempat mendaftarkan package Dart/Flutter.',
    ],
  ),
  Question(
    text: 'Package state management yang memakai ChangeNotifier adalah...',
    options: ['http', 'Provider', 'sqflite', 'flutter_svg'],
    correctIndex: 1,
    optionExplanations: [
      'Package http dipakai untuk mengirim permintaan ke server (API), bukan untuk state management.',
      'Provider memakai ChangeNotifier dan notifyListeners() untuk membagikan state serta memperbarui widget yang mendengarkannya.',
      'sqflite dipakai untuk database SQLite lokal, bukan state management.',
      'flutter_svg dipakai untuk menampilkan gambar berformat SVG.',
    ],
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
    optionExplanations: [
      'flutter create dipakai untuk membuat proyek baru, bukan menjalankannya.',
      'flutter clean menghapus folder build dan cache proyek.',
      'flutter build menghasilkan file rilis (misalnya APK), bukan menjalankan aplikasi langsung saat pengembangan.',
      'flutter run membangun lalu menjalankan aplikasi di emulator atau perangkat yang terhubung.',
    ],
  ),
  Question(
    text: 'Widget untuk menampilkan gambar dari folder aset adalah...',
    options: ['Image.network', 'Image.file', 'Image.asset', 'Icon'],
    correctIndex: 2,
    optionExplanations: [
      'Image.network memuat gambar dari URL internet, bukan dari folder aset.',
      'Image.file memuat gambar dari file di penyimpanan perangkat.',
      'Image.asset memuat gambar yang dibundel bersama aplikasi di folder aset (didaftarkan di pubspec.yaml).',
      'Icon menampilkan simbol dari icon font (seperti Icons.home), bukan file gambar dari folder aset.',
    ],
  ),
];
