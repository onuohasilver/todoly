import 'package:get_it/get_it.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todoly/main.dart';
import 'package:todoly/modules/tasks/repository/todo_repository_impl.dart';

import 'services/tasks/local_tasks_service_impl.dart';

/// Create an instance of GetIt
final GetIt locator = GetIt.instance;

// Function to setup the Service Locator
Future<void> setupLocator() async {
  // Register the database as a singleton
  locator.registerLazySingleton<Database>(() => database);

  // Register the implementation of TodoRepository as a factory
  locator.registerFactory<TodoRepositoryImpl>(
      () => TodoRepositoryImpl(lts: locator()));

  // Register the implementation of LocalTasksService as a factory
  locator.registerFactory<LocalTasksServiceImpl>(
    () => LocalTasksServiceImpl(db: locator()),
  );
}
