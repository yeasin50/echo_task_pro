import 'package:f3/features/text_summarize/presentation/widgets/text_choose_option.dart';
import 'package:f3/locator.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import '../../data/datasources/temp_data.dart';

class SummarizeTextPage extends StatefulWidget {
  const SummarizeTextPage({super.key});

  @override
  State<SummarizeTextPage> createState() => _SummarizeTextPageState();
}

class _SummarizeTextPageState extends State<SummarizeTextPage> {
  late final TextEditingController _textEditingController = TextEditingController.fromValue(TextEditingValue(text: tempLongText));

  bool isSummarizing = false;
  String? summarizedText;

  void summarizeText() async {
    FocusScope.of(context).unfocus();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Summarize Text"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
          icon: isSummarizing ? const CircularProgressIndicator.adaptive() : const Icon(Icons.summarize),
          label: Text(summarizedText == null ? "Summarize" : "Clear"),
          onPressed: summarizedText == null ? summarizeText : clearText,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text("Input Text"),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 10,
              minLines: 4,
              controller: _textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "your long text here",
              ),
            ),
            TextGetterOption(
              onTextGet: (text) {
                _textEditingController.text = text;
                // summarizeText();
              },
            ),
            if (summarizedText != null) ...[
              const Text("Output Text"),
              const SizedBox(height: 20),
              Text(summarizedText!),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}
