import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_utils/my_utils.dart';

import '../../../chat/data/datasources/chatbot_palm_api.dart';

class SummarizeTextWithPalmDataSource {
  get userID => FirebaseAuth.instance.currentUser?.uid ?? 'NaN';

  CollectionReference get ref => FirebaseFirestore.instance.collection("users/$userID/text_documents/");

  Future<String?> summarizeText(String text) async {
    try {
      final doc = await ref.add({'text': text});

      await for (final s in doc.snapshots()) {
        logger.d("Message map event ${s.data()}");
        final data = s.data() as Map<String, dynamic>?;
        if (data?['summary'] != null) {
          return data!['summary'];
        }
      }
    } catch (e) {
      logger.e("summarizeText ${e.toString()}");
      rethrow;
    }
  }
}
