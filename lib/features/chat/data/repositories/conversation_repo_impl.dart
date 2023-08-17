import 'package:f3/features/chat/domain/entities/message.dart';
import 'package:f3/locator.dart';
import 'package:fpdart/fpdart.dart';

import 'package:my_utils/my_utils.dart';

import '../../domain/repositories/conversation_repo.dart';
import '../datasources/chatbot_palm_api.dart';

class ConversationRepoImpl implements ConversationRepo {
  @override
  Stream<List<(Message, Message)>> getMessage() async* {
    final stream = locator.get<ChatBotPaLM>().messagePath.snapshots();

    final s = stream.map((event) {
      logger.d("Message map event ${event.docs.length}");
      return event.docs.map((e) {
        final data = e.data();

        logger.d("Message map event ${data['prompt']} ${data['response']}");

        // if (data['status']?['state'] != 'COMPLETED') {
        //
        // }

        /// on each element we get two messages, one for the user and one for the bot
        final userMessage = Message(
          id: e.id,
          text: data['prompt'] ?? 'NaN',
          authorId: locator.get<ChatBotPaLM>().userID,
          createdAt: DateTime.now(),
          // createdAt: DateTime.fromMillisecondsSinceEpoch(data['createTime']),
        );

        final response = data['response'] ?? 'NaN';
        // final botMessage = Message(
        //   authorId: 'bot',
        //   createdAt: DateTime.fromMillisecondsSinceEpoch(response['completeTime']),
        //   id: 'bot',
        //   text: data['response'],
        // );

        // logger.d("Message map event ${userMessage.text} ${botMessage.text}");
        return (userMessage, userMessage);
      }).toList();
    });

    yield* s;
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(Message message) async {
    final result = await locator.get<ChatBotPaLM>().sendMessage(message.text);
    if (result) {
      return const Right(unit);
    } else {
      return Left(ServerFailure());
    }
  }
}
