import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:edu_platform/features/tutors/presentation/views/tutors_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorIteam extends StatefulWidget {
  const TutorIteam({super.key, this.isFavorite = true, required this.tutors});
  final bool isFavorite;
  final TutorsEntity tutors;

  @override
  State<TutorIteam> createState() => _TutorIteamState();
}

class _TutorIteamState extends State<TutorIteam> {
  bool isLiked = false;
  @override
  void initState() {
    isLiked = widget.tutors.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TutorsView(tutors: widget.tutors),
        ));
      },
      child: Container(
        height: 148,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: whiteGrey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.user),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: widget.tutors.isOnline
                      ? Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: green,
                            border: Border.all(color: white, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        )
                      : null,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tutors.whom,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.eduUnSl,
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.tutors.event.studentCount} students',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: inputGrey),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                if (widget.isFavorite)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: isLiked
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.tutors.about,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(AppIcons.star),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 4),
                  child: Text(
                    '${widget.tutors.rating.ball}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Text(
                  'Ratings: ${widget.tutors.rating.count}',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: inputGrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
