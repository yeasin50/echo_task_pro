import 'package:f3/features/chat/presentation/utils/to_type_message.dart';
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
  final _ai = const types.User(id: 'bot');

  ///while sending message
  types.TextMessage? loadingMessage;
  List<types.TextMessage> messages = [];

  late final stream = locator.get<ChatBotPaLM>().messages;
  //locator.get<ConversationRepoImpl>().getMessage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Echo Task Pro'),
      ),
      body: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            logger.d("state ${snapshot.connectionState} ${snapshot.data}}");
            if (snapshot.connectionState == ConnectionState.active) {
              final data = snapshot.data?.docs;
              data?.forEach((element) {
                logger.d("state ${element.data()}");
              });

              // snapshot.data?.map((e) {
              //   final userMessage = e.$1;
              //   final botMessage = e.$2;
              //   messages.add(userMessage.toChatMessage());
              //   messages.add(botMessage.toChatMessage());
              //   logger.d("state ${userMessage.text} ${botMessage.text}");
              // });

              // setState(() {});
            }
            return fcui.Chat(
              messages: [
                ...messages,
                if (loadingMessage != null) loadingMessage!,
              ],
              onSendPressed: _handleSendPressed,
              user: _user,
            );
          }),
    );
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = Message(
      authorId: _user.id,
      createdAt: DateTime.now(),
      id: locator.get<ChatBotPaLM>().messagePath.id,
      text: message.text,
    );

    setState(() {
      loadingMessage = types.TextMessage(
        author: types.User(id: _user.id),
        createdAt: textMessage.createdAt.millisecondsSinceEpoch,
        id: textMessage.id,
        text: textMessage.text,
      );
    });

    await locator.get<ConversationRepoImpl>().sendMessage(textMessage);

    setState(() {
      loadingMessage = null;
    });
  }
}
