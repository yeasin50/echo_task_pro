import 'package:flutter/material.dart';

import 'features/speech_to_task/presentation/pages/speech_to_text_testpage.dart';

class EchoTaskPro extends MaterialApp {
  const EchoTaskPro({super.key});

  @override
  Widget? get home => const SpeechToTextTestPage();
}
