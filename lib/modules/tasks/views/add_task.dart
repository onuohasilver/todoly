import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoly/core/navigator.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/modules/tasks/view_models/todo_view_model.dart';
import 'package:todoly/widgets/buttons/custom_flat_button.dart';
import 'package:todoly/widgets/inputs/custom_text_field.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController titleCtrl = TextEditingController();

  final TextEditingController setPriority = TextEditingController();

  String priority = "Low";

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(
      builder: (context, tvm, _) {
        return Container(
          // height: 250.h,
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YSpace(20),
              Text(
                "Add new",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const YSpace(12),
              CustomTextField(
                label: "Title",
                controller: titleCtrl,
              ),
              const YSpace(12),
              Text(
                "Set Priority",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "Low",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Radio(
                          value: "Low",
                          groupValue: priority,
                          onChanged: (_) {
                            setState(() {
                              priority = _.toString();
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Medium",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Radio(
                          value: "Medium",
                          groupValue: priority,
                          onChanged: (_) {
                            setState(() {
                              priority = _.toString();
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "High",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Radio(
                          value: "High",
                          groupValue: priority,
                          onChanged: (_) {
                            setState(() {
                              priority = _.toString();
                            });
                          }),
                    ],
                  ),
                ],
              ),
              const YSpace(12),
              CustomFlatButton(
                onTap: () async {
                  await tvm.addTodo(TodoModel(
                      id: null,
                      title: titleCtrl.text,
                      done: false,
                      priority: priority));
                  Navigate.pop();
                },
                label: "Save",
                bgColor: Colors.black,
                expand: true,
              ),
              const YSpace(42)
            ],
          ),
        );
      },
    );
  }
}
