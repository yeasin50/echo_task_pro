import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../entities/message.dart';

abstract interface class ConversationRepo {
  ///get all messages from specific conversation(user, bot)
  Stream<List<(Message, Message)>> getMessage();

  ///send message to specific conversation(user)
  /// a response is expected from bot
  Future<Either<Failure, Unit>> sendMessage(Message message);
}
