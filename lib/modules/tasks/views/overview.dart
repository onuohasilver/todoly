import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/modules/tasks/view_models/todo_view_model.dart';
import 'package:todoly/modules/tasks/views/add_task.dart';
import 'package:todoly/modules/tasks/views/widgets/todo_card.dart';
import 'package:todoly/widgets/custom_overlays.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

import 'widgets/task_status_card.dart';

class TodoOverview extends StatefulWidget {
  const TodoOverview({super.key});

  @override
  State<TodoOverview> createState() => _TodoOverviewState();
}

class _TodoOverviewState extends State<TodoOverview> {
  List<TodoModel>? models;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F8F8),
          floatingActionButton: FloatingActionButton(
            onPressed: () => CustomOverlays().showSheet(child: AddTask()),
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
          body: FutureBuilder<List<TodoModel>>(
              future: viewModel.fetchData(),
              builder: (context, snapshot) {
                // log(snapshot.data.toString());
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  // log("snapshot.data.toString()");
                  models = snapshot.data!;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const YSpace(60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                  text: "Hello, ",
                                  children: [
                                    TextSpan(
                                        text: "Reece",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                height: 1.5,
                                                fontSize: 24)),
                                  ],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 24, color: Colors.grey)),
                            ),
                            FadeIn(
                              child: Image.asset(
                                "assets/avatar.png",
                                height: 50,
                              ),
                            )
                          ],
                        ),
                        const YSpace(20),
                        Row(
                          children: [
                            Expanded(
                              child: SlideInLeft(
                                child: TaskStatusCard(
                                    color: Theme.of(context).cardColor,
                                    label: "Pending\nTasks",
                                    value: "23"),
                              ),
                            ),
                            const XSpace(10),
                            Expanded(
                              child: SlideInRight(
                                child: TaskStatusCard(
                                    color: Colors.lightBlue.shade800,
                                    label: "Completed\nTasks",
                                    value: "10"),
                              ),
                            ),
                          ],
                        ),
                        const YSpace(30),
                        Text("My tasks",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    fontSize: 24)),
                        const YSpace(12),
                        Expanded(
                          child: ListView.builder(
                              itemCount: models?.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return BounceInUp(
                                    key: Key(models![index].id.toString()),
                                    // key: (models![index].title),
                                    duration:
                                        Duration(milliseconds: index * 150),
                                    // duration: Duration(seconds: index * 60),
                                    child: Todocard(model: models![index]));
                              }),
                        )
                      ],
                    ),
                  );
                }
              }),
        );
      },
    );
  }
}
