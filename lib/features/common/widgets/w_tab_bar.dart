import 'package:edu_platform/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final Function(int)? onTap;

  const WTabBar({this.tabController, required this.tabs, Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: dividerGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        padding: const EdgeInsets.all(4),
        labelPadding: const EdgeInsets.all(8),
        indicator: ShapeDecoration(
          shadows: [
            BoxShadow(
                blurRadius: 1,
                offset: const Offset(0, 3),
                color: const Color(0xff000000).withOpacity(0.04)),
            BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 3),
                color: const Color(0xff000000).withOpacity(0.12)),
          ],
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: const Color(0xff000000).withOpacity(0.04)),
              borderRadius: BorderRadius.circular(8)),
          color: green,
        ),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: onTap,
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
        labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
        unselectedLabelColor: dark,
        labelColor: white,
        tabs: tabs,
      ),
    );
  }
}
