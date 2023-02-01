import 'package:get_it/get_it.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todoly/main.dart';
import 'package:todoly/modules/tasks/repository/todo_repository_impl.dart';

import 'services/tasks/local_tasks_service_impl.dart';

final GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  locator.registerLazySingleton<Database>(() => database);
  locator.registerFactory<TodoRepositoryImpl>(
      () => TodoRepositoryImpl(lts: locator()));
  locator.registerFactory<LocalTasksServiceImpl>(
    () => LocalTasksServiceImpl(db: locator()),
  );
}
