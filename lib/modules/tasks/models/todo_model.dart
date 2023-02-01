import 'package:todoly/services/tasks/local_tasks_service_impl.dart';

/// TodoModel class represents the Todo tasks object in the application
class TodoModel {
  /// id of the task
  final int? id;

  /// title of the task
  final String title;

  /// status of the task if it's done or not
  final bool done;

  /// priority of the task
  final String priority;

  /// Converts the Todo task object to Map object
  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0,
      columnPriority: priority
    };
    map[columnId] = id;
    return map;
  }

  // Constructor for Todo task object
  TodoModel(
      {required this.id,
      required this.title,
      required this.done,
      required this.priority});

  // Factory method that creates a Todo task object from Map object
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
        id: map[columnId],
        title: map[columnTitle],
        done: map[columnDone] == 1,
        priority: map[columnPriority] ?? "Low");
  }

  // Copy method that creates a new Todo task object with given values
  TodoModel copyWith({int? id, String? title, bool? done, String? priority}) {
    return TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        done: done ?? this.done,
        priority: priority ?? this.priority);
  }

  // Returns a string representation of Todo task object
  @override
  String toString() {
    return '$title $priority';
  }
}
