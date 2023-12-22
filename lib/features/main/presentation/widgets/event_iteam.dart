import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class EventIteam extends StatelessWidget {
  const EventIteam({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              WScaleAnimation(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: const Color(0xffC444D9),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AppIcons.live.svg(),
                      ),
                      Text(
                        'Enter lesson',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: white),
                      )
                    ],
                  ),
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
                  child: AppIcons.calendar.svg(color: inputGrey),
                ),
                Text(
                  'Sun, 12 April',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: inputGrey),
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
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: inputGrey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
