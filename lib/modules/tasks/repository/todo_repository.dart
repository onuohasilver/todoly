import 'package:todoly/modules/tasks/models/todo_model.dart';

/// Abstract class that defines methods for working with to-do data.
abstract class TodoRepository {
  /// Fetches a list of [TodoModel] from storage.
  Future<List<TodoModel>> fetchData();

  /// Inserts a new [TodoModel] into storage.
  Future<TodoModel> insert(TodoModel todo);

  /// Deletes a [TodoModel] from storage by its id.
  Future<int> delete(int id);

  /// Updates an existing [TodoModel] in storage.
  Future<int> update(TodoModel todo);

  /// Closes any open resources used by the repository.
  Future close();
}
