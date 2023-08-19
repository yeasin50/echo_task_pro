import 'package:f3/features/home/presentation/widgets/chat_griditem.dart';
import 'package:flutter/material.dart';

import 'text_summarize_griditem.dart';

class OnLoadedView extends StatelessWidget {
  const OnLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AppBar(
                title: const Text("PaLM AI example"),
                centerTitle: true,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  children: const [
                    ChatBotGridItem(),
                    TextSummarizeGridItem(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
