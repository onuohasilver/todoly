import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoly/modules/tasks/view_models/todo_view_model.dart';
import 'package:todoly/modules/tasks/views/add_task.dart';
import 'package:todoly/modules/tasks/views/widgets/sort_modal.dart';
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
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoViewModel>(context, listen: false).fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TodoViewModel tvm = Provider.of<TodoViewModel>(context);

    return Consumer<TodoViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
            backgroundColor: const Color(0xFFF8F8F8),
            floatingActionButton: FloatingActionButton(
                onPressed: () =>
                    CustomOverlays().showSheet(child: const AddTask()),
                backgroundColor: Colors.black,
                child: const Icon(Icons.add)),
            body: viewModel.todo == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
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
                              child:
                                  Image.asset("assets/avatar.png", height: 50),
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
                                    value:
                                        "${viewModel.getPendingTodos().length}"),
                              ),
                            ),
                            const XSpace(10),
                            Expanded(
                              child: SlideInRight(
                                child: TaskStatusCard(
                                    color: Colors.lightBlue.shade800,
                                    label: "Completed\nTasks",
                                    value:
                                        "${viewModel.getFinishedTodos().length}"),
                              ),
                            ),
                          ],
                        ),
                        const YSpace(30),
                        // Text(viewModel.todo.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My tasks",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                        fontSize: 24)),
                            TextButton(
                              child: Text("Sort By",
                                  style: Theme.of(context).textTheme.bodyText1),
                              onPressed: () {
                                CustomOverlays()
                                    .showSheet(child: const SortModal());
                              },
                            )
                          ],
                        ),
                        const YSpace(12),
                        // Text(viewModel.todo.toString())
                        Expanded(
                          child: ListView.builder(
                              itemCount: viewModel.todo?.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return BounceInUp(
                                    key: Key(
                                        viewModel.todo![index].id.toString()),
                                    duration:
                                        Duration(milliseconds: index * 150),
                                    child: Todocard(
                                        model: viewModel.todo![index]));
                              }),
                        ),
                      ],
                    ),
                  ));
      },
    );
  }
}
