import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      this.validator,
      this.hint,
      this.borderRadius,
      this.onChanged,
      this.maxLines = 1,
      this.formatter,
      this.initialValue,
      required this.controller})
      : super(key: key);
  final String label;
  final String? hint, initialValue;
  final BorderRadius? borderRadius;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatter;
  final int maxLines;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold)),
        const YSpace(5),
        TextFormField(
          controller: controller,
          inputFormatters: formatter,
          initialValue: initialValue,
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 224, 222, 222))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFFCCCCCC))),

            // label: CustomText(label, size: 14),
          ),
        ),
      ],
    );
  }
}
