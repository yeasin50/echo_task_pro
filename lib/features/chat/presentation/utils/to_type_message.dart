import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../domain/entities/message.dart';

extension ToChatMessage on Message {
  types.TextMessage toTypeMessage() {
    return types.TextMessage(
      author: types.User(id: authorId), 
      createdAt: createdAt.millisecondsSinceEpoch,
      id: id,
      text: text,
    );
  }
}
