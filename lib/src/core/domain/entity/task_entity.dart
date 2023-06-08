import 'package:flutter/cupertino.dart';

@immutable
class TaskEntity {
  final int? id;
  final String title;
  final String description;
  final DateTime dtCreated;
  final DateTime? dtExpiration;
  final DateTime? dtEnded;
  final TaskStatus status;
  final TaskImportance importance;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  const TaskEntity({
    this.id,
    required this.title,
    required this.description,
    required this.dtCreated,
    this.dtExpiration,
    this.dtEnded,
    required this.status,
    required this.importance,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        dtCreated:
            DateTime.fromMillisecondsSinceEpoch(json['dtCreated'] as int),
        dtExpiration: json['dtExpiration'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['dtExpiration'] as int),
        dtEnded: json['dtEnded'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['dtEnded'] as int),
        status: TaskStatus.values
            .firstWhere((element) => element.name == json['status']),
        importance: TaskImportance.values
            .firstWhere((element) => element.name == json['importance']),
      );

  @override
  bool operator ==(Object other) =>
      other is TaskEntity && id == other.id && title == other.title;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'dtCreated': dtCreated.millisecondsSinceEpoch,
        'dtExpiration': dtExpiration?.millisecondsSinceEpoch,
        'dtEnded': dtEnded?.millisecondsSinceEpoch,
        'status': status.name,
        'importance': importance.name,
      };
}

enum TaskStatus { created, inProgress, done, failed }

enum TaskImportance { low, normal, high, fire }
