import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.ce,
          children: [
            FadeInLeft(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const YSpace(12),
            const YSpace(12),
            SlideInUp(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey,
                      height: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator(
    this.color, {
    Key? key,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 10.w,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
