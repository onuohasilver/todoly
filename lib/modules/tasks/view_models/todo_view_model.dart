import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/modules/tasks/repository/todo_repository_impl.dart';

/// This class is the ViewModel for Todo, it provides an interface between the data model
/// and the UI, encapsulating business logic and state management.
class TodoViewModel extends ChangeNotifier {
  final TodoRepositoryImpl todoRepo;

  TodoViewModel({required this.todoRepo});

  /// The list of Todo tasks
  List<TodoModel>? _todos;

  /// The getter for the list of Todo tasks
  List<TodoModel>? get todo => _todos;

  /// The current sorting type
  SortType _sort = SortType.none;

  /// The `fetchData` function retrieves the list of Todo tasks from the repository
  /// and sorts them based on the current sort type.
  Future<List<TodoModel>> fetchData() async {
    _todos = await todoRepo.fetchData();

    switch (_sort) {
      case SortType.none:
        _todos = _todos!.reversed.toList();
        break;
      case SortType.name:
        _sortByName();
        break;
      case SortType.priority:
        _sortByPriority();
        break;
      default:
    }
    notifyListeners();
    return _todos!;
  }

  /// The `addTodo` function inserts a new Todo task into the repository, retrieves
  /// the updated list of Todo tasks, and notifies any listeners of the change.
  addTodo(TodoModel todo) async {
    await todoRepo.insert(todo);
    await fetchData();
    log("Todo added successfully");
    notifyListeners();
  }

  /// The `updateTodo` function updates an existing Todo task in the repository, retrieves
  /// the updated list of Todo tasks, and notifies any listeners of the change.
  updateTodo(TodoModel todo) async {
    await todoRepo.update(todo);
    await fetchData();
    notifyListeners();
  }

  /// The `deleteTodo` function deletes a Todo task from the repository, retrieves
  /// the updated list of Todo tasks, and notifies any listeners of the change.
  deleteTodo(TodoModel todo) async {
    await todoRepo.delete(todo.id!);
    await fetchData();
    notifyListeners();
  }

  /// The `_sortByName` function sorts the list of Todo tasks by their names.
  _sortByName() {
    List<TodoModel> todoCopy = [..._todos!];
    todoCopy.sort((a, b) => a.title.compareTo(b.title));
    _todos = todoCopy;
    notifyListeners();
  }

  /// Sorts the todos based on priority.
  void _sortByPriority() {
    List<TodoModel> todoCopy = [..._todos!];
    todoCopy.sort((a, b) => a.priority.compareTo(b.priority));
    _todos = todoCopy;
  }

  /// Sets the sort type for the todos and fetches data based on the sort type.
  void setSort(SortType sortType) {
    _sort = sortType;
    fetchData();
  }

  /// Returns a list of todos with `done` property set to `false`.
  List<TodoModel> getPendingTodos() {
    return _todos!.where((todo) => !todo.done).toList();
  }

  /// Returns a list of todos with `done` property set to `true`.
  List<TodoModel> getFinishedTodos() {
    return _todos!.where((todo) => todo.done).toList();
  }
}

enum SortType { priority, name, none }
