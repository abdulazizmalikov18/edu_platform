import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(AppImages.user),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Teacher Darren'),
                  Text(
                    'Online',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: green),
                  ),
                ],
              ),
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
          ],
        ),
        body: ListView(),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          color: white,
          child: WTextField(
            onChanged: (value) {},
            hintText: 'Type something...',
            suffixIcon: AppIcons.close,
          ),
        ),
      ),
    );
  }
}
