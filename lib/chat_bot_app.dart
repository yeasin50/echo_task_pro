import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/chat/presentation/pages/conversation_page.dart';
import 'firebase_options.dart';

void main(List<String> args) {
  runApp(const ChatBotApp());
}

class ChatBotApp extends MaterialApp {
  const ChatBotApp({super.key});

  @override
  Widget? get home => _InitPage();

  @override
  ThemeData? get theme => ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      );
}

class _InitPage extends StatelessWidget {
  const _InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _init() async {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    }

    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const ConversationPage();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
