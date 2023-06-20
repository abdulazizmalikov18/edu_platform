import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TutorsView extends StatelessWidget {
  const TutorsView({super.key, required this.tutors});
  final TutorsEntity tutors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(AppImages.user),
            ),
            const SizedBox(width: 16),
            Text(tutors.whom),
          ],
        ),
        actions: [
          PopupMenuButton(
            elevation: 0,
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.share_outlined),
                    SizedBox(width: 16),
                    Text('Share'),
                  ],
                ),
              ),
              const PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 16),
                    Text('Favorite'),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //     onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: dividerGrey),
              color: whiteGrey,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'British',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: green),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Accent',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: buttonTextGreen),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                tutors.event.studentCount.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: green),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Students',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: buttonTextGreen),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                tutors.lang,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: green),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Lessons',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: buttonTextGreen),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  color: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            height: 32,
                            child: Text(
                              tutors.currentAddress,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 16),
                        child: Text(
                          'About me',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        tutors.about,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: buttonTextGreen),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time_outlined),
                      const SizedBox(width: 8),
                      Text(
                        'edu-platform teacher since may 18, 2021',
                        style: Theme.of(context).textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 48,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 160,
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderGrey),
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '452',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Students',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: buttonTextGreen),
                    )
                  ],
                ),
              ),
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
                  'Me as a Teacher',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  tutors.aboutTeacher,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: buttonTextGreen),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: borderGrey),
              borderRadius: BorderRadius.circular(16),
              color: white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Resume',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: borderGrey),
              color: white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Certificates',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: whiteGrey,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    border: Border.all(color: dividerGrey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trial lesson',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'One time, 15 minutes',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: buttonTextGreen),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: SvgPicture.asset(
                          AppIcons.warning,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                    border: Border.all(color: dividerGrey),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trial lesson',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Free',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: green,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      WButton(
                        onTap: () {},
                        text: 'Call',
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: whiteGrey,
              border: Border(top: BorderSide(color: dividerGrey)),
            ),
            child: Text(
              'Private Lessons',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            height: 76,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {},
                    text: 'Contact Teacher',
                    textColor: dark,
                    color: white,
                    border: Border.all(color: dividerGrey),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WButton(
                    onTap: () {},
                    text: 'Start lesson',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
