import 'package:f3/locator.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

class SummarizeTextPage extends StatefulWidget {
  const SummarizeTextPage({super.key});

  @override
  State<SummarizeTextPage> createState() => _SummarizeTextPageState();
}

class _SummarizeTextPageState extends State<SummarizeTextPage> {
  final testText = """
You have to collect your plant as the first step of propagation from a plant market or a nursery which they will provide you in a pot. 

– Make Some Cuttings
Now you have to accomplish some tasks to ensure the healthy growth of the plant in water and multiply it without the support of any inert matter like soil or gravel.

At first, you have to cut the plantlets or young, small baby spider plants, which the mother plant produces on runner or stolon due to asexual reproduction. Use sharp tools like knives or scissors to cut the plantlets or spiderettes. 

– Place It in A Jar
Then place the extracted baby plants in a jar full of water but be careful so that the full plantlet doesn’t get submerged as only the root or bottom part is required to be immersed in water.

Be careful to keep the plantlets in the right position, as it’s also a vital requirement to grow the plant in water. Keep spiderettes vertical in a jar or container, and new roots will be shown in a week to two weeks, and as a result, a healthy spider plant can live until 20 years on average.

– Non-chlorinated Water
Proper maintenance is the key to making spider plants grow faster in water. It would be best to fill up the jar or container where you will raise the plant with pure, non-chlorinated water and put the spider plant babies into the jar, ensuring its leaves stay outside the water. 
""";

  late final TextEditingController _textEditingController = TextEditingController.fromValue(TextEditingValue(text: testText));

  bool isSummarizing = false;
  String? summarizedText;

  void summarizeText() async {
    FocusScope.of(context).unfocus();
    setState(() {
      isSummarizing = true;
    });
    final result = await locator.get<SummarizeTextWithPalmDataSource>().summarizeText(_textEditingController.text);

    logger.d(result);
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
            const SizedBox(
              height: 20,
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
