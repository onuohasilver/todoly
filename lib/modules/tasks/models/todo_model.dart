import 'package:todoly/services/tasks/local_tasks_service_impl.dart';

class TodoModel {
  final int? id;
  final String title;
  final bool done;
  final String priority;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };
    map[columnId] = id;
    return map;
  }

  TodoModel(
      {required this.id,
      required this.title,
      required this.done,
      required this.priority});

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
        id: map[columnId],
        title: map[columnTitle],
        done: map[columnDone] == 1,
        priority: map[columnPriority]);
  }

  TodoModel copyWith({int? id, String? title, bool? done, String? priority}) {
    return TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        done: done ?? this.done,
        priority: priority ?? this.priority);
  }

  @override
  String toString() {
    return '$title $priority';
  }
}

const String tableTodo = 'todo';
const String columnId = '_id';
const String columnTitle = 'title';
const String columnDone = 'done';
