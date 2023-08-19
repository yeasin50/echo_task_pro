import 'package:f3/features/chat/presentation/pages/chat_page.dart';
import 'package:f3/features/text_summarize/presentation/pages/summarize_text_page.dart';
import 'package:f3/locator.dart';
import 'package:flutter/material.dart';

import '../widgets/on_loaded_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: setup(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const OnLoadedView();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
