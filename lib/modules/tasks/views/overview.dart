import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoly/modules/tasks/views/add_task.dart';
import 'package:todoly/widgets/custom_overlays.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

import 'widgets/task_status_card.dart';

class TasksOverview extends StatelessWidget {
  const TasksOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () => CustomOverlays().showSheet(child: const AddTask()),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: Padding(
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
                          .copyWith(fontSize: 24, color: Colors.grey)),
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    fontSize: 24)),
            const YSpace(12),
            Container(
              // height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (_) {}),
                        SizedBox(
                          width: 250,
                          child: Text(
                              "Get groceries from the greee groceries from the greee groceries from the greee ",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle1),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.close, color: Colors.red.shade400),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
