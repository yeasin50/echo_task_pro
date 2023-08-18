import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'features/chat/data/datasources/chatbot_palm_api.dart';
import 'features/chat/data/repositories/conversation_repo_impl.dart';
import 'firebase_options.dart';

final locator = GetIt.I;
Future<void> setup() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuth.instance.signInAnonymously();

  locator.registerLazySingleton(() => ChatBotPaLM());
  locator.registerLazySingleton(() => ConversationRepoImpl());
}
