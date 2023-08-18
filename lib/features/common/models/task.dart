import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({
    required this.createdAt,
    required this.title,
    this.description,
    this.isDone = false,
    this.link,
    this.startDate,
    this.endDate,
    this.reminderDate,
  });

  final DateTime createdAt; //use as id
  final String title;
  final String? description;
  final bool isDone;

  // [link] is used when we will have meetings
  final String? link;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? reminderDate;

  @override
  List<Object?> get props => [createdAt, title, description, isDone, link, startDate, endDate, reminderDate];

  @override
  String toString() {
    return 'Task(createdAt: $createdAt, title: $title, description: $description, isDone: $isDone, link: $link, startDate: $startDate, endDate: $endDate, reminderDate: $reminderDate)';
  }
}
