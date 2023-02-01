import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoly/locator.dart';
import 'package:todoly/modules/intro/views/intro.dart';
import 'package:todoly/modules/tasks/repository/todo_repository_impl.dart';
import 'package:todoly/modules/tasks/view_models/todo_view_model.dart';
import 'package:todoly/services/tasks/local_tasks_service_impl.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late Database database;

Future<void> initDB() async {
  database = await openDatabase(
    'todo',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnPriority text not null,
  $columnDone integer not null)
''');
    },
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDB();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                TodoViewModel(todoRepo: locator<TodoRepositoryImpl>()))
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, __) => MaterialApp(
                title: 'Flutter Demo',
                navigatorKey: navigatorKey,
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    cardColor: Colors.orange,
                    textTheme: GoogleFonts.nunitoTextTheme()),
                home: const Intro(),
              )),
    );
  }
}
