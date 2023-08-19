import 'package:flutter/material.dart';

import '../../../text_summarize/presentation/pages/summarize_text_page.dart';

class TextSummarizeGridItem extends StatelessWidget {
  const TextSummarizeGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    return Material(
      color: Colors.blue[100],
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SummarizeTextPage(),
            ),
          );
        },
        child: Icon(
          Icons.summarize_rounded,
        ),
      ),
    );
  }
}
