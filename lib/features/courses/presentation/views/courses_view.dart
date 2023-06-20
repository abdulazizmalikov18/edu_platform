import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/courses/domain/entity/courses_entity.dart';
import 'package:flutter/material.dart';

class Coursesview extends StatelessWidget {
  const Coursesview({super.key, required this.courseList});
  final CoursesEntity courseList;

  @override
  Widget build(BuildContext context) {
    // List<String> list = ['Beginner', '12 lesson'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 288,
            child: Column(
              children: [
                Container(
                  height: 184,
                  decoration: const BoxDecoration(
                    color: Color(0xff8FF727),
                    image: DecorationImage(
                      image: AssetImage(AppImages.userMult),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: whiteGrey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseList.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        courseList.descr,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderGrey),
              color: white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  courseList.overview,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: buttonTextGreen),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderGrey),
              color: white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What will you be able to do?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  courseList.presentation,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: buttonTextGreen),
                ),
              ],
            ),
          ),
          // ListView.builder(
          //   itemCount: 2,
          //   shrinkWrap: true,
          //   physics: const BouncingScrollPhysics(),
          //   padding: const EdgeInsets.all(16),
          //   itemBuilder: (context, index) => InkWell(
          //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => const Coursesview(),
          //     )),
          //     child: Container(
          //       margin: const EdgeInsets.only(bottom: 16),
          //       height: 288,
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 184,
          //             decoration: BoxDecoration(
          //               borderRadius: const BorderRadius.vertical(
          //                   top: Radius.circular(20)),
          //               color: index == 0
          //                   ? Colors.yellow
          //                   : const Color(0xff8FF727),
          //               image: const DecorationImage(
          //                 image: AssetImage(AppImages.userMult),
          //               ),
          //             ),
          //             alignment: Alignment.bottomLeft,
          //             child: SizedBox(
          //               height: 48,
          //               child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 itemCount: list.length,
          //                 itemBuilder: (context, index) => Container(
          //                   margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
          //                   padding: const EdgeInsets.all(8),
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(20),
          //                     color: dark.withOpacity(.6),
          //                   ),
          //                   child: Text(
          //                     list[index],
          //                     style: const TextStyle(
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w400,
          //                       color: white,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             padding: const EdgeInsets.all(16),
          //             decoration: BoxDecoration(
          //               color: white,
          //               border: Border.all(color: whiteGrey),
          //               borderRadius: const BorderRadius.vertical(
          //                   bottom: Radius.circular(20)),
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Basic Conversation Topics',
          //                   style: Theme.of(context).textTheme.bodyMedium,
          //                 ),
          //                 const SizedBox(height: 8),
          //                 Text(
          //                   'Gain confidence speaking about familiar topics',
          //                   style: Theme.of(context).textTheme.bodySmall,
          //                 )
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: dividerGrey)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Syllabus',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                WButton(
                  onTap: () {},
                  text: 'Beginner',
                  textColor: dark,
                  border: Border.all(color: dividerGrey),
                  color: white,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  borderRadius: 20,
                ),
                WButton(
                  margin: const EdgeInsets.only(left: 16),
                  onTap: () {},
                  text: '12 Lesson',
                  textColor: dark,
                  border: Border.all(color: dividerGrey),
                  color: white,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  borderRadius: 20,
                ),
              ],
            ),
            WButton(
              margin: const EdgeInsets.only(top: 16),
              onTap: () {},
              text: 'Start course',
            )
          ],
        ),
      ),
    );
  }
}
