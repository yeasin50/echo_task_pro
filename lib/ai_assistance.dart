import 'package:flutter/material.dart';

import 'features/home/presentation/pages/home_page.dart';

class AiAssistance extends MaterialApp {
  const AiAssistance({super.key});

  @override
  Widget? get home => const HomePage();

  @override
  bool get debugShowCheckedModeBanner => false;

  @override
  ThemeData? get theme => ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      );
}
