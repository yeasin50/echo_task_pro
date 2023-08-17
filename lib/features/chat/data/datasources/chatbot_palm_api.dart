import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_utils/my_utils.dart';

export 'package:cloud_firestore/cloud_firestore.dart';

//DONE: whitelist :)
class ChatBotPaLM {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get userID => FirebaseAuth.instance.currentUser?.uid ?? 'NaN';
  String get discussionId => 'chatbot_palm';
  CollectionReference<Map<String, dynamic>> get messagePath => _firestore.collection("users/$userID/discussions/$discussionId/messages");

  Stream<QuerySnapshot<Map>> get messages => messagePath.snapshots();

  Future<bool> sendMessage(String message) async {
    try {
      final ref = await messagePath.add({'prompt': message});

      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
