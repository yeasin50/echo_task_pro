import '../utils/to_type_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as fcui;
import 'package:my_utils/my_utils.dart';

import '../../../../locator.dart';
import '../../data/datasources/chatbot_palm_api.dart';
import '../../data/repositories/conversation_repo_impl.dart';
import '../../domain/entities/message.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final _user = types.User(id: locator.get<ChatBotPaLM>().userID);

  ///while sending message
  bool isSending = false;
  List<types.Message> messages = [];

  types.TextMessage get testMessage => types.TextMessage(
        author: types.User(id: 'bot'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'bot-1',
        text: 'Hello',
      );

  @override
  void initState() {
    super.initState();

    locator.get<ConversationRepoImpl>().getMessages().then((value) {
      value.fold((l) => logger.e(l), (r) {
        logger.d("r is ${r.length}");

        for (final element in r) {
          messages.add(element.$2.toTypeMessage());
          messages.add(element.$1.toTypeMessage());
        }
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: fcui.Chat(
        messages: [
          ...messages,
        ],
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = Message(
      authorId: _user.id,
      createdAt: DateTime.now(),
      id: locator.get<ChatBotPaLM>().messagePath.id,
      text: message.text,
    );

    late types.TextMessage sendingMessage;

    sendingMessage = types.TextMessage(
      author: _user,
      createdAt: textMessage.createdAt.millisecondsSinceEpoch,
      id: "temp",
      text: textMessage.text,
      status: types.Status.sent, //todo: change to sending
    );
    final botLoadingMessage = types.TextMessage(
      author: types.User(id: 'bot'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'bot',
      text: '...',
    );

    setState(() {
      messages.insert(0, sendingMessage);
      messages.insert(0, botLoadingMessage);
    });

    final response = await locator.get<ConversationRepoImpl>().sendMessage(textMessage);

    messages.remove(sendingMessage);
    messages.remove(botLoadingMessage);

    response.fold((l) {
      logger.e(l);
      messages.insert(0, sendingMessage.copyWith(status: types.Status.error));
      // messages.insert(0, botLoadingMessage.copyWith(status: types.Status.error));
    }, (r) {
      messages.insert(0, r.$1.toTypeMessage());
      messages.insert(0, r.$2.toTypeMessage());

      setState(() {});
    });
  }
}
