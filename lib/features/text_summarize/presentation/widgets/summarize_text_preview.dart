import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SummarizeTextView extends StatelessWidget {
  const SummarizeTextView({
    super.key,
    required this.text,
    this.labelTextStyle,
  });

  final String text;
  final TextStyle? labelTextStyle;

  @override
  Widget build(BuildContext context) {
    void copyTextToClipBoard() {
      Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied to clipboard")));
    }

    void showTextOnDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Summarized Text"),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: copyTextToClipBoard,
              child: const Text("Copy"),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Text("Summarize Text", style: labelTextStyle),
            const Spacer(),
            IconButton(
              onPressed: copyTextToClipBoard,
              icon: const Icon(Icons.copy_rounded),
            ),
          ],
        ),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: showTextOnDialog,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: Text(text),
          ),
        )
      ],
    );
  }
}
