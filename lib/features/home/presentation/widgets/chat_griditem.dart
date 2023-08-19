import 'package:flutter/material.dart';

import '../../../chat/presentation/pages/chat_page.dart';

class ChatBotGridItem extends StatelessWidget {
  const ChatBotGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatPage(),
            ),
          );
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.chat_bubble_outline_rounded,
        ),
      ),
    );
  }
}
