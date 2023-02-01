import 'package:flutter/material.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/modules/tasks/repository/todo_repository_impl.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepositoryImpl todoRepo;

  TodoViewModel({required this.todoRepo});

  List<TodoModel>? _todos;
  List<TodoModel>? get todo => _todos;

  Future<List<TodoModel>> fetchData() async {
    List<TodoModel> res = await todoRepo.fetchData();
    return res.reversed.toList();
  }

  addTodo(TodoModel todo) async {
    await todoRepo.insert(todo);
    await fetchData();
    notifyListeners();
  }

  updateTodo(TodoModel todo) async {
    await todoRepo.update(todo);
    await fetchData();
    notifyListeners();
  }

  deleteTodo(TodoModel todo) async {
    await todoRepo.delete(todo.id!);
    notifyListeners();
    await fetchData();
  }
}
