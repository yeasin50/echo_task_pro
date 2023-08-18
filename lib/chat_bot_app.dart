import 'package:flutter/material.dart';

import 'features/chat/presentation/pages/chat_page.dart';

void main(List<String> args) {
  runApp(const ChatBotApp());
}

class ChatBotApp extends MaterialApp {
  const ChatBotApp({super.key});

  @override
  Widget? get home => const ChatPage();

  @override
  bool get debugShowCheckedModeBanner => false;

  @override
  ThemeData? get theme => ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      );
}
