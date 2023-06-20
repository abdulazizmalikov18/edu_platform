import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:edu_platform/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';

class SignUpNameView extends StatelessWidget {
  const SignUpNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
      appBar: AppBar(
        title: const Text('Sign Up'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Almost there! What’s your name?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 48),
          Text(
            'Full name',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: WTextField(
              onChanged: (value) {},
              hintText: 'John doe',
            ),
          ),
          Text(
            'Type your name in English characters will help tutors pronnounce your name correctly',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: buttonTextGreen),
          ),
          WButton(
            margin: const EdgeInsets.only(top: 24),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MainView(),
                ),
                (route) => false,
              );
            },
            text: 'Next',
          )
        ],
      ),
    );
  }
}
