import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoly/core/navigator.dart';
import 'package:todoly/modules/intro/views/widgets/splash_content.dart';
import 'package:todoly/modules/tasks/views/overview.dart';
import 'package:todoly/widgets/buttons/custom_flat_button.dart';
import 'package:todoly/widgets/layout/box_sizing.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.hasClients) {
        setState(() {
          currentIndex = pageController.page!.toInt();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
              height: 500.h,
              width: double.infinity,
              child: Image.asset("assets/splash.png", fit: BoxFit.cover)),
          const YSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => PageIndicator(
                  currentIndex == index ? Colors.blue : Colors.grey.shade400),
            ),
          ),
          const YSpace(12),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                SplashContent(
                    title: "Organise your tasks efficiently",
                    subtitle:
                        "Welcome to TaskPro! The ultimate task management tool. Stay organized, on top of your tasks, and reach your goals with ease."),
                SplashContent(
                  subtitle:
                      "Take control of your schedule with TaskPro. Simplify your tasks, prioritize your goals, and make every day more productive.",
                  title: "Plan your day with TaskPro",
                ),
                SplashContent(
                  title: "Manage your daily \ntasks with TaskPro",
                  subtitle:
                      "Transform your task list into a well-oiled machine with TaskPro. Say goodbye to cluttered notes and hello to a beautifully organized life.",
                ),
              ],
            ),
          ),
          const YSpace(24),
          Padding(
            padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ) +
                EdgeInsets.only(bottom: 30.h),
            child: BounceInUp(
              delay: const Duration(milliseconds: 500),
              child: CustomFlatButton(
                onTap: () => Navigate.to(const TasksOverview()),
                label: "Start",
                bgColor: Colors.black,
                expand: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
