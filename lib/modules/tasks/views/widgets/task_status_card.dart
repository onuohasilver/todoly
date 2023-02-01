import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskStatusCard extends StatelessWidget {
  const TaskStatusCard({
    Key? key,
    required this.color,
    required this.value,
    required this.label,
  }) : super(key: key);
  final Color color;
  final String value, label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: color, width: 3),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            alignment: Alignment.center,
            width: 60.w,
            height: 60.h,
            child: Text(value,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                    decoration: label.contains("Complete")
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
