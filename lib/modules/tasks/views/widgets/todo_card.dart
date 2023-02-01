import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoly/modules/tasks/models/todo_model.dart';
import 'package:todoly/modules/tasks/view_models/todo_view_model.dart';

class Todocard extends StatelessWidget {
  const Todocard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final TodoModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(builder: (context, viewModel, _) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: model.done,
                      onChanged: (_) {
                        viewModel.updateTodo(model.copyWith(done: _));
                      }),
                  SizedBox(
                    width: 250,
                    child: Text(model.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: model.done ? Colors.grey : Colors.black,
                            decoration: model.done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none)),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      child: Icon(Icons.close, color: Colors.red.shade400),
                      onTap: () => viewModel.deleteTodo(model),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
