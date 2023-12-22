import 'dart:math';

import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/main/presentation/views/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDataIteam extends StatelessWidget {
  SelectDataIteam({super.key});

  /// Users who use the same liveID can join the same live streaming.
  final liveTextCtrl = TextEditingController(text: Random().nextInt(10000).toString());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 312,
            margin: const EdgeInsets.only(bottom: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: dividerGrey),
              color: white,
            ),
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: dividerGrey,
                  ),
                  child: Image.asset(AppImages.calendar),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 8),
                  child: Text(
                    'Schedule a Lesson',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'You have no scheduled lessons. Select a teacher to get started.',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                WButton(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const CalendarView(),
                    ));
                  },
                  text: 'Schedule lesson',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
