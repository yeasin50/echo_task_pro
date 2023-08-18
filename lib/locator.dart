import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'features/chat/data/datasources/chatbot_palm_api.dart';
import 'features/chat/data/repositories/conversation_repo_impl.dart';
import 'features/text_summarize/data/datasources/summarize_text_with_palm.dart';
import 'firebase_options.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:f3/features/text_summarize/data/datasources/summarize_text_with_palm.dart';

final locator = GetIt.I;
Future<void> setup() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuth.instance.signInAnonymously();

  locator.registerLazySingleton(() => ChatBotPaLM());
  locator.registerLazySingleton(() => ConversationRepoImpl());
  locator.registerLazySingleton(() => SummarizeTextWithPalmDataSource());
}
