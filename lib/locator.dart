import 'package:get_it/get_it.dart';

import 'features/chat/data/datasources/chatbot_palm_api.dart';
import 'features/chat/data/repositories/conversation_repo_impl.dart';

final locator = GetIt.I;
void setup() {
  locator.registerLazySingleton(() => ChatBotPaLM());
  locator.registerLazySingleton(() => ConversationRepoImpl());
}
