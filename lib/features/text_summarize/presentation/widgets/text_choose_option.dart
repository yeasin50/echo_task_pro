import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

class TextGetterOption extends StatelessWidget {
  const TextGetterOption({
    super.key,
    required this.onTextGet,
    required this.textEditingController,
  });

  final Function(String text) onTextGet;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: textEditingController,
            builder: (context, value, child) => AnimatedAlign(
              alignment: value.text.isEmpty ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 300),
              child: ElevatedButton.icon(
                onPressed: pickFile,
                label: const Text("Open File"),
                icon: const Icon(Icons.file_open),
              ),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            onTextGet("");
          },
          icon: const Icon(Icons.clear),
          label: Text("Clear"),
        ),
      ],
    );
  }

  void pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
      );

      if (result?.files.single.path != null) {
        File file = File(result!.files.single.path!);
        final text = await file.readAsString();
        onTextGet(text);
      } else {
        logger.d("No file selected");
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
