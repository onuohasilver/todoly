import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    Key? key,
    this.label = '',
    required this.onTap,
    this.hasBorder = false,
    this.icon,
    this.expand = false,
    this.alignment,
    this.color,
    this.bgColor,
    this.suffix,
    this.prefix,
    this.elevation = 0,
  }) : super(key: key);
  final String label;
  final String? icon;
  final MainAxisAlignment? alignment;
  final bool hasBorder, expand;
  final int elevation;
  final Color? color, bgColor;
  final Function() onTap;
  final Widget? suffix, prefix;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation.toDouble()),
          minimumSize: MaterialStateProperty.all(const Size(250, 50)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
          side: hasBorder
              ? MaterialStateProperty.all(
                  BorderSide(color: Colors.grey.shade300, width: 1))
              : null,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: MaterialStateProperty.all(bgColor ?? Colors.white)),
      child: Row(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: alignment ??
            (expand ? MainAxisAlignment.center : MainAxisAlignment.start),
        children: [
          prefix ??
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: color ?? Colors.white, height: 1.5),
              ),
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}
