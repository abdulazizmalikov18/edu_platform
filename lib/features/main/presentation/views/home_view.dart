import 'dart:math';

import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:edu_platform/features/main/presentation/views/live_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> list = ['Upcoming', 'Live', 'Need schedule', 'Complated'];
  PageController controller = PageController(initialPage: 0);
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 76,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => WScaleAnimation(
                onTap: () {
                  setState(() {
                    select = index;
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44),
                    border: Border.all(color: select == index ? green : whiteGrey),
                    color: select == index ? green : white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    list[index],
                    style: TextStyle(color: select == index ? white : null),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                SelectDataIteam(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: white,
                          border: Border.all(color: dividerGrey),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(AppImages.user),
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    'John Due',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: const Color(0xffC444D9),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: SvgPicture.asset(AppIcons.live),
                                      ),
                                      Text(
                                        'Enter lesson',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(color: white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    margin: const EdgeInsets.only(right: 8),
                                    child: SvgPicture.asset(
                                      AppIcons.calendar,
                                      colorFilter: const ColorFilter.mode(
                                        inputGrey,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Sun, 12 April',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: inputGrey),
                                  ),
                                  Container(
                                    height: 16,
                                    width: 16,
                                    margin: const EdgeInsets.only(
                                      right: 6,
                                      left: 16,
                                    ),
                                    child: const Icon(
                                      Icons.access_time,
                                      color: inputGrey,
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    '12:00 AM - 12:30 AM',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: inputGrey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SelectDataIteam(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectDataIteam extends StatelessWidget {
  SelectDataIteam({
    super.key,
  });

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
                  onTap: () => jumpToLivePage(
                    context,
                    liveID: liveTextCtrl.text,
                    isHost: true,
                  ),
                  text: 'Schedule lesson',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  jumpToLivePage(BuildContext context, {required String liveID, required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VideoConferencePage(conferenceID: "video_conference_id_234"),
      ),
    );
  }
}
