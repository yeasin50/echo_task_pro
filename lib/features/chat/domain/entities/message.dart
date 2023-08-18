import 'dart:convert';

import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({
    required this.id,
    required this.authorId,
    required this.text,
    required this.createdAt,
  });
  
  final String id;
  final String authorId;
  final String text;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, authorId, text, createdAt];

  Message copyWith({
    String? id,
    String? authorId,
    String? text,
    DateTime? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'authorId': authorId});
    result.addAll({'text': text});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] ?? '',
      authorId: map['authorId'] ?? '',
      text: map['text'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(id: $id, authorId: $authorId, text: $text, createdAt: $createdAt)';
  }
}
