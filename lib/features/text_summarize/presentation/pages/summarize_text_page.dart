import 'package:flutter/material.dart';

import '../../../../locator.dart';
import '../../data/datasources/temp_data.dart';
import '../widgets/summarize_text_preview.dart';
import '../widgets/text_choose_option.dart';

class SummarizeTextPage extends StatefulWidget {
  const SummarizeTextPage({super.key});

  @override
  State<SummarizeTextPage> createState() => _SummarizeTextPageState();
}

class _SummarizeTextPageState extends State<SummarizeTextPage> {
  late final TextEditingController _textEditingController = TextEditingController();

  bool isSummarizing = false;
  String? summarizedText;

  void summarizeText() async {
    FocusScope.of(context).unfocus();

    if (_textEditingController.text.isEmpty) return;
    setState(() {
      isSummarizing = true;
    });
    final result = await locator.get<SummarizeTextWithPalmDataSource>().summarizeText(_textEditingController.text);

    // logger.d(result);
    isSummarizing = false;
    summarizedText = result;
    setState(() {});
  }

  void clearText() {
    summarizedText = null;
    _textEditingController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const labelTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Summarize Text"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 8,
          right: 8,
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            // minimumSize: const Size(double.infinity, 50),
            backgroundColor: _textEditingController.text.isEmpty ? Colors.grey : Colors.blue,
            foregroundColor: _textEditingController.text.isEmpty ? Colors.black : Colors.white,
          ),
          icon: isSummarizing ? const CircularProgressIndicator.adaptive() : const Icon(Icons.summarize),
          label: Text(summarizedText == null ? "Summarize" : "Reset"),
          onPressed: summarizedText == null ? summarizeText : clearText,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Input Section", style: labelTextStyle),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 10,
              minLines: 4,
              controller: _textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your text here OR open a text file",
              ),
            ),
            TextGetterOption(
              key: const ValueKey("text_getter_option"),
              textEditingController: _textEditingController,
              onTextGet: (text) {
                _textEditingController.text = text;
                summarizedText = null;
                setState(() {});
              },
            ),
            if (summarizedText != null) SummarizeTextView(text: summarizedText!)
          ],
        ),
      ),
    );
  }
}
