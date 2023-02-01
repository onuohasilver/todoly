import 'package:todoly/modules/tasks/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> fetchData();
  Future<TodoModel> insert(TodoModel todo);
  Future<int> delete(int id);
  Future<int> update(TodoModel todo);
  Future close();
}
