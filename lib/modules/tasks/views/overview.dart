import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class TasksOverview extends StatelessWidget {
  const TasksOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YSpace(60),
            Text.rich(
              TextSpan(
                  text: "Hello, ",
                  children: [
                    TextSpan(
                        text: "Reece",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
            const YSpace(20),
            Row(
              children: [
                TaskStatusCard(
                    color: Theme.of(context).cardColor,
                    label: "Pending\nTasks",
                    value: "23"),
                const XSpace(10),
                TaskStatusCard(
                    color: Colors.lightBlue.shade800,
                    label: "Completed\nTasks",
                    value: "10"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

