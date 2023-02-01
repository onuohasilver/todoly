import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/services/tasks/local_tasks_service.dart';

const String tableTodo = 'todo';
const String columnId = '_id';
const String columnTitle = 'title';
const String columnDone = 'done';
const String columnPriority = 'priority';

/// Implementing class of the `LocalTasksService`
///
/// It uses sqflite package to interact with local SQLite database
class LocalTasksServiceImpl extends LocalTasksService {
  final Database db;

  /// Constructor to initialize the database instance
  LocalTasksServiceImpl({required this.db});

  /// Method to fetch data from the local database
  Future<List<TodoModel>> fetchData() async {
    // Selecting all columns from table `todo`
    List<Map> maps = await db.query(tableTodo);

    // Mapping the data from the query result to a list of `TodoModel`
    return maps
        .map((e) => TodoModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  /// Method to insert a todo into the local database
  @override
  Future<TodoModel> insert(TodoModel todo) async {
    // Logging the database instance
    log(db.toString());

    // Inserting the todo into the table `todo`
    int id = await db.insert(tableTodo, todo.toMap());

    // Returning the todo with updated id
    return todo.copyWith(id: id);
  }

  /// Method to retrieve a todo from the local database
  @override
  Future<TodoModel?> getTodo(int id) async {
    // Selecting columns `columnId`, `columnDone`, `columnTitle`
    // from table `todo` where `columnId` equals the input `id`
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);

    // If the query result is not empty, returning the first todo
    if (maps.isNotEmpty) {
      return TodoModel.fromMap(maps.first as Map<String, dynamic>);
    }

    // Return `null` if the todo is not found in the local database
    return null;
  }

  /// Method to delete a todo from the local database
  @override
  Future<int> delete(int id) async {
    // Deleting the todo from table `todo` where `columnId` equals the input `id`
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  /// Updating a [TodoModel] in the database.
  /// [todo] The [TodoModel] to be updated.
  /// Returns a [Future] with [int] indicating the number of updated rows.
  @override
  Future<int> update(TodoModel todo) async {
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  /// Closing the connection to the database.
  @override
  Future close() async => db.close();
}
