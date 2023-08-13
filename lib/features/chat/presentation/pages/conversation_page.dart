import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:my_utils/my_utils.dart';

import '../../data/datasources/chatbot_palm_api.dart';
import '../utils/random_string.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _ai = const types.User(id: '82091008-a48c');

  final chatbot = ChatBotPaLM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Echo Task Pro'),
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomID(),
      text: message.text,
    );

    _addMessage(textMessage);

    await chatbot.getChatBotPaLMResponse(message.text);
    //add reply
    final replyMessage = types.TextMessage(
      author: _ai,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomID(),
      text: 'Hello, how can I help you?',
    );
    _addMessage(replyMessage);
  }
}
