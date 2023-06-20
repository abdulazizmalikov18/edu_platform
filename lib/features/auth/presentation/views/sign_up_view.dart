import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/auth/presentation/views/login_view.dart';
import 'package:edu_platform/features/auth/presentation/views/sign_up_whom.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Sign Up'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height*0.3,
            // ),
            const Text('Email'),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: WTextField(
                onChanged: (value) {},
                hintText: 'Example@domain.com',
              ),
            ),
            const Text('Password'),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: WTextField(
                onChanged: (value) {},
                hintText: 'Your password',
              ),
            ),
            WButton(
              margin: const EdgeInsets.only(bottom: 24),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignUpWhomView(),
                ));
              },
              text: 'Sign up for free',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WScaleAnimation(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ));
                  },
                  child: Text(
                    'I already have an account',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),
            WButton(
              onTap: () {},
              text: 'Sign up with Google',
              color: buttonGrey,
              textColor: dark,
            ),
            WButton(
              margin: const EdgeInsets.symmetric(vertical: 20),
              onTap: () {},
              text: 'Sign up with Facebook',
              color: buttonGrey,
              textColor: dark,
            )
          ],
        ),
      ),
    );
  }
}
