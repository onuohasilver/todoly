import 'package:sqflite/sqlite_api.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';

/// Abstract class that defines an interface for interacting with local task data
abstract class LocalTasksService {
  LocalTasksService(this.db);
  final Database db;

  /// Method to insert a to-do item into the local database
  Future<TodoModel> insert(TodoModel todo);

  /// Method to retrieve a specific to-do item from the local database using its ID
  Future<TodoModel?> getTodo(int id);

  /// Method to delete a specific to-do item from the local database using its ID
  Future<int> delete(int id);

  /// Method to update a specific to-do item in the local database
  Future<int> update(TodoModel todo);

  /// Method to close the connection to the local database
  Future close();
}
