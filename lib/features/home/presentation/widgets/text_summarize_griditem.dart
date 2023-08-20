import 'package:flutter/material.dart';

import 'button_shape.dart';

class TextSummarizeGridItem extends StatelessWidget {
  const TextSummarizeGridItem({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final shape = CustomButtonShape(alignment: Alignment.centerLeft);
    return Material(
      shape: shape,
      child: GestureDetector(
        child: InkWell(
            customBorder: shape,
            onTap: onTap,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.summarize_rounded),
                SizedBox(height: 8),
                Text("Summarize"),
              ],
            )),
      ),
    );
  }
}
