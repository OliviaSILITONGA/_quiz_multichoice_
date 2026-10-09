import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/page_container.dart';
import '../widgets/primary_button.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: context.read<QuizProvider>().userName,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    if (!_formKey.currentState!.validate()) return;
    context.read<QuizProvider>().startQuiz(_nameController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  void _continueQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: PageContainer(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/quiz_logo.png',
                  height: context.dp(0.4),
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.quiz_rounded,
                    size: context.dp(0.35),
                    color: scheme.primary,
                  ),
                ),
              ),
              SizedBox(height: context.dp(0.05)),
              Text(
                'Kuis Pilihan Ganda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.dp(0.07),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: context.dp(0.015)),
              Text(
                'Masukkan namamu untuk memulai kuis',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.dp(0.038),
                  color: scheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: context.dp(0.07)),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(fontSize: context.dp(0.042)),
                onFieldSubmitted: (_) => _startQuiz(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  if (value.trim().length < 2) {
                    return 'Nama minimal 2 karakter';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nama',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    size: context.dp(0.06),
                  ),
                  filled: true,
                  fillColor: scheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(context.dp(0.035)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: context.dp(0.04),
                    horizontal: context.dp(0.04),
                  ),
                ),
              ),
              SizedBox(height: context.dp(0.05)),
              PrimaryButton(
                label: 'Mulai Kuis',
                icon: Icons.play_arrow_rounded,
                onPressed: _startQuiz,
              ),
              if (quiz.hasProgress) ...[
                SizedBox(height: context.dp(0.03)),
                PrimaryButton(
                  label:
                      'Lanjutkan (${quiz.answeredCount}/${quiz.totalQuestions})',
                  icon: Icons.restore_rounded,
                  isOutlined: true,
                  onPressed: _continueQuiz,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
