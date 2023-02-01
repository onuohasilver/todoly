import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/modules/tasks/repository/todo_repository.dart';
import 'package:todoly/services/tasks/local_tasks_service_impl.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({
    required this.lts,
  });

  final LocalTasksServiceImpl lts;

  // LocalTasksServiceImpl lcc = locator<LocalTasksServiceImpl>();
  @override
  Future<List<TodoModel>> fetchData() async {
    return await lts.fetchData();
  }

  @override
  Future close() async {
    await lts.close();
  }

  @override
  Future<int> delete(int id) async {
    return await lts.delete(id);
  }

  @override
  Future<TodoModel> insert(TodoModel todo) async {
    return await lts.insert(todo);
  }

  @override
  Future<int> update(TodoModel todo) async {
    return await lts.update(todo);
  }
}
