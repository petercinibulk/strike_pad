import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String id;
  final String text;
  final DateTime datetimeAdded;
  final bool strike;

  Task({
    String? id,
    required this.text,
    DateTime? datetimeAdded,
    bool? strike,
  })  : id = id ?? const Uuid().v4(),
        datetimeAdded = datetimeAdded ?? DateTime.now(),
        strike = strike ?? false;

  /// Creates a Task from Json map
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as String,
        text: json['text'] as String,
        datetimeAdded: json['datetimeAdded'] as DateTime,
        strike: json['strike'] as bool,
      );

  /// Creates a copy of the current Task with property changes
  Task copyWith({
    String? id,
    String? text,
    DateTime? datetimeAdded,
    bool? strike,
  }) {
    return Task(
      id: id ?? this.id,
      text: text ?? this.text,
      datetimeAdded: datetimeAdded ?? this.datetimeAdded,
      strike: strike ?? this.strike,
    );
  }

  @override
  List<Object?> get props => [
        id,
        text,
        datetimeAdded,
        strike,
      ];

  /// Creates a Json map from a Task
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'text': text,
        'datetimeAdded': datetimeAdded,
        'strike': strike,
      };
}
