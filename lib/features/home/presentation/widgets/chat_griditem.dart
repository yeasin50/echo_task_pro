import 'package:f3/features/home/presentation/widgets/button_shape.dart';
import 'package:flutter/material.dart';

class ChatBotGridItem extends StatelessWidget {
  const ChatBotGridItem({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final shape = CustomButtonShape(alignment: Alignment.centerRight);
    //duplicates,merge later
    return Material(
      color: Colors.blue[100],
      shape: shape,
      child: InkWell(
        onTap: onTap,
        customBorder: shape,
        child: const Icon(Icons.chat_bubble_outline_rounded),
      ),
    );
  }
}
