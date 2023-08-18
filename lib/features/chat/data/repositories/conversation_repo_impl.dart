import 'package:f3/features/chat/domain/entities/message.dart';
import 'package:f3/locator.dart';
import 'package:fpdart/fpdart.dart';

import 'package:my_utils/my_utils.dart';

import '../../domain/repositories/conversation_repo.dart';
import '../datasources/chatbot_palm_api.dart';

class ConversationRepoImpl implements ConversationRepo {
  Message _userMessage(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Message(
      id: doc.id,
      text: data['prompt'] ?? 'NaN',
      authorId: locator.get<ChatBotPaLM>().userID,
      createdAt: DateTime.now(),
      // createdAt: DateTime.fromMillisecondsSinceEpoch(data['createTime']),
    );
  }

  Message _botMessage(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    final response = data['response'] ?? 'NaN';
    return Message(
      authorId: 'bot',
      createdAt: DateTime.now(),
      // DateTime.fromMillisecondsSinceEpoch(response['completeTime']),
      id: "bot-${doc.id}",
      text: response,
    );
  }

  ///! not using directly on StreamBuilder for some N reasons
  @Deprecated('use getMessages() instead') //😂
  @override
  Stream<List<(Message, Message)>> getMessageStream() {
    final stream = locator.get<ChatBotPaLM>().messagePath.snapshots();

    final msgStream = stream.map((event) {
      // logger.d("Message map event ${event.docs.length}");
      return event.docs.map((e) {
        final data = e.data();
        if (data['status']?['state'] != 'COMPLETED') {}

        /// on each element we get two messages, one for the user and one for the bot
        final userMessage = _userMessage(e);
        final botMessage = _botMessage(e);

        return (userMessage, botMessage);
      }).toList();
    });

    return msgStream;
  }

  @override
  Future<Either<Failure, (Message sent, Message replay)>> sendMessage(Message message) async {
    try {
      final data = await locator.get<ChatBotPaLM>().sendMessage(message.text);

      if (data?['response'] != null) {
        final sent = Message(
          id: data!['id'],
          text: data!['prompt'] ?? 'NaN',
          authorId: locator.get<ChatBotPaLM>().userID,
          createdAt: DateTime.now(), //TODO
        );

        final replayMessage = data['response'];

        final replay = Message(
          authorId: 'bot',
          createdAt: DateTime.now(),
          // DateTime.fromMillisecondsSinceEpoch(response['completeTime']),
          id: "bot-${data['id']}",
          text: replayMessage,
        );

        return Right((sent, replay));
      } else {
        return Left(NullFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<(Message user, Message bot)>>> getMessages() async {
    try {
      final snapshot = await locator.get<ChatBotPaLM>().messagePath.get();

      final data = snapshot.docs.map((e) {
        final data = e.data();

        /// on each element we get two messages, one for the user and one for the bot
        final userMessage = _userMessage(e);
        final botMessage = _botMessage(e);

        return (userMessage, botMessage);
      }).toList();

      logger.d("data ${data.length}");

      return Right(data);
    } catch (e) {
      logger.e(e.toString());
      return Left(ServerFailure());
    }
  }
}
