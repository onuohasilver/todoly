import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoly/core/navigator.dart';
import 'package:todoly/modules/tasks/view_models/todo_view_model.dart';
import 'package:todoly/widgets/buttons/custom_flat_button.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class SortModal extends StatelessWidget {
  const SortModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(builder: (context, viewModel, _) {
      return Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            const YSpace(20),
            CustomFlatButton(
              onTap: () {
                viewModel.setSort(SortType.priority);
                Navigate.pop();
              },
              expand: true,
              hasBorder: true,
              prefix: const Icon(Icons.add_alert_outlined),
              suffix: Text(
                "Sort by Priority",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              color: Colors.black,
            ),
            const YSpace(14),
            CustomFlatButton(
              onTap: () {
                viewModel.setSort(SortType.name);
                Navigate.pop();
              },
              expand: true,
              hasBorder: true,
              prefix: const Icon(Icons.abc_outlined),
              suffix: Text(
                "Sort by Name",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              color: Colors.black,
            ),
            const YSpace(14),
            CustomFlatButton(
              onTap: () {
                viewModel.setSort(SortType.none);
                Navigate.pop();
              },
              expand: true,
              hasBorder: true,
              prefix: const Icon(Icons.abc_outlined),
              suffix: Text(
                "Clear Sorting",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              color: Colors.black,
            ),
            const YSpace(45),
          ],
        ),
      );
    });
  }
}
