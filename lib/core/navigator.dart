// Navigate is a helper class to handle navigation between pages in the application.
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoly/main.dart';

class Navigate {
  Navigate();

  // static method to navigate to the given screen.
  static to(Widget screen) {
    BuildContext context = navigatorKey.currentContext!;
    Navigator.push(
        context,
        // Use CupertinoPageRoute for iOS and MaterialPageRoute for Android.
        Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => screen)
            : MaterialPageRoute(builder: (context) => screen));
  }

  // static method to replace the current screen with the given screen.
  static replace(Widget screen) {
    BuildContext context = navigatorKey.currentContext!;

    Navigator.pushReplacement(
        context,
        Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => screen)
            : MaterialPageRoute(builder: (context) => screen));
  }

  // static method to pop the current screen. Can pop multiple screens by specifying number.
  static pop({int number = 1}) {
    BuildContext context = navigatorKey.currentContext!;

    for (var i = 0; i < number; i++) {
      Navigator.pop(context);
    }
  }

  // static method to replace the current screen and remove all previous screens from the stack.
  static replaceUntil(Widget screen) {
    BuildContext context = navigatorKey.currentContext!;
    Navigator.pushAndRemoveUntil(
        context,
        Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => screen)
            : MaterialPageRoute(builder: (context) => screen),
        (_) => false);
  }
}
