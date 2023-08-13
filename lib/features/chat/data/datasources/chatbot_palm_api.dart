import 'package:cloud_firestore/cloud_firestore.dart';

//TODO: waitlist :)
class ChatBotPaLM {
  final FirebaseFirestore _firestore;

  ChatBotPaLM({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<String?> getChatBotPaLMResponse(String message) async {
    final ref = await _firestore.collection('users').add({'prompt': message});

    ref.snapshots();
  }
}
