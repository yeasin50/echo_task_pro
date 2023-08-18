import 'package:f3/features/chat/presentation/pages/chat_page.dart';
import 'package:f3/features/text_summarize/presentation/pages/summarize_text_page.dart';
import 'package:f3/locator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setup(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const SummarizeTextPage();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
