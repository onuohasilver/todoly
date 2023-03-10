import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoly/core/navigator.dart';
import 'package:todoly/main.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class CustomOverlays {
  showPopup(child, {bool popPrevious = false}) {
    if (popPrevious) Navigate.pop();
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return Dialog(
            child: child,
            insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          );
        });
  }

  showSheet({required child, Function()? onClose, bool popPrevious = false}) {
    if (popPrevious) Navigate.pop();
    showModalBottomSheet(
      isScrollControlled: true,
      context: navigatorKey.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: SlideInUp(
                child: SizedBox(
                  // height: height.h,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 18.w),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Material(
                              color: Colors.white,
                              type: MaterialType.circle,
                              child: IconButton(
                                  onPressed: () => Navigate.pop(),
                                  icon: const Icon(Icons.close)),
                            ),
                          ),
                        ),
                        const YSpace(25),
                        child,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) => onClose?.call());
  }
}
