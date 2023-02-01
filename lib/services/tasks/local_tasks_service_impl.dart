import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/services/tasks/local_tasks_service.dart';

const String tableTodo = 'todo';
const String columnId = '_id';
const String columnTitle = 'title';
const String columnDone = 'done';
const String columnPriority = 'priority';

class LocalTasksServiceImpl extends LocalTasksService {
  final Database db;

  LocalTasksServiceImpl({required this.db});
  Future<List<TodoModel>> fetchData() async {
    List<Map> maps = await db.query(tableTodo);
    return maps
        .map((e) => TodoModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<TodoModel> insert(TodoModel todo) async {
    log(db.toString());
    int id = await db.insert(tableTodo, todo.toMap());

    return todo.copyWith(id: id);
  }

  @override
  Future<TodoModel?> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return TodoModel.fromMap(maps.first as Map<String, dynamic>);
    }

    return null;
  }

  @override
  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  @override
  Future<int> update(TodoModel todo) async {
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  @override
  Future close() async => db.close();
}
