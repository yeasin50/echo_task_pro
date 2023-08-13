import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../entities/message.dart';

abstract interface class ConversationRepo {
  ///get message for specific conversation(user)
  Future<Either<Failure, List<Message>>> getMessage(String id);

  ///send message to specific conversation(user)
  /// a response is expected from bot
  Future<Either<Failure, Message>> sendMessage(Message message);
}
