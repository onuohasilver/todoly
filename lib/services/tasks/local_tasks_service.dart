import 'package:todoly/modules/tasks/models/todo_model.dart';

abstract class LocalTasksService {
  // open(String path);
  Future<TodoModel> insert(TodoModel todo);
  Future<TodoModel?> getTodo(int id);
  Future<int> delete(int id);
  Future<int> update(TodoModel todo);
  Future close();
}
