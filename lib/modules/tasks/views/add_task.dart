import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoly/widgets/buttons/custom_flat_button.dart';
import 'package:todoly/widgets/inputs/custom_text_field.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YSpace(20),
          Text(
            "Create a new task",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const YSpace(12),
          const CustomTextField(label: "Title"),
          const YSpace(12),
          const CustomTextField(label: "Description", maxLines: 3),
          const YSpace(12),
          Text(
            "Set Priority",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Chip(label: Text("sss"), avatar: Icon(Icons.abc)),
          const YSpace(12),
          CustomFlatButton(
            onTap: () {},
            label: "Save",
            bgColor: Colors.black,
            expand: true,
          ),
          const YSpace(12)
        ],
      ),
    );
  }
}
