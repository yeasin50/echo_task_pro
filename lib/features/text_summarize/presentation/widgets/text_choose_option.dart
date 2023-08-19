import 'package:flutter/material.dart';

class TextGetterOption extends StatelessWidget {
  const TextGetterOption({
    super.key,
    required this.onTextGet,
  });

  final Function(String text) onTextGet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton.icon(
          onPressed: () async {},
          label: const Text("Open File"),
          icon: const Icon(Icons.folder_open_rounded),
        )
      ],
    );
  }
}
