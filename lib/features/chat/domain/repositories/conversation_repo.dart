import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../entities/message.dart';

abstract interface class ConversationRepo {
  ///get all messages from specific conversation(user, bot)
  Stream<List<(Message, Message)>> getMessageStream();

  ///get all messages on initState from specific conversation(user, bot)
  Future<Either<Failure, List<(Message sent, Message replay)>>> getMessages();

  ///send message to specific conversation(user)
  /// a response is expected from bot
  Future<Either<Failure, (Message sent, Message replay)>> sendMessage(Message message);
}
