import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/modules/tasks/repository/todo_repository_impl.dart';
import 'package:todoly/services/tasks/local_tasks_service_impl.dart';

import 'todoly_test.mocks.dart';

@GenerateMocks([LocalTasksServiceImpl])
@GenerateMocks([TodoRepositoryImpl])
void main() {
  late Database database;
  late MockLocalTasksServiceImpl taskService;
  late MockTodoRepositoryImpl todoRepo;

  String databaseRules = '''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnPriority text not null,
  $columnDone integer not null)
''';
  TodoModel testTask =
      TodoModel(id: 1, title: "first ", done: false, priority: "High");
  List<TodoModel> taskList = List.generate(10, (index) => testTask);
  setUpAll(() async {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await database.execute(databaseRules);
    taskService = MockLocalTasksServiceImpl();
    todoRepo = MockTodoRepositoryImpl();

    when(taskService.insert(any)).thenAnswer((_) async => testTask);
    when(taskService.update(any)).thenAnswer((_) async => 1);
    when(taskService.delete(any)).thenAnswer((_) async => 1);
    when(taskService.getTodo(any)).thenAnswer((_) async => testTask);
    when(taskService.fetchData()).thenAnswer((_) async => taskList);
  });
  group("Test TodoRepo", () {
    // Test the `fetchData` method

    // Test the `insert` method
    test('insert', () async {
      expect(await taskService.insert(testTask), testTask);
      verify(taskService.insert(testTask));
    });

    test('update', () async {
      expect(await taskService.insert(testTask), testTask);
      verify(taskService.insert(testTask));
    });

    test('delete', () async {
      expect(await taskService.insert(testTask), testTask);
      verify(taskService.insert(testTask));
    });

    test('getToDo', () async {
      expect(await taskService.insert(testTask), testTask);
      verify(taskService.insert(testTask));
    });

    test('fetchData', () async {
      expect(await taskService.insert(testTask), testTask);
      verify(taskService.insert(testTask));
    });
  });
}
