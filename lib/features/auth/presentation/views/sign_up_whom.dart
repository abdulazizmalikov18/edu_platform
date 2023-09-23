import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/auth/presentation/views/sign_up_name.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class SignUpWhomView extends StatelessWidget {
  const SignUpWhomView({
    super.key,
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Sign Up'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Who will be learning English on edu-platform?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            WButton(
              margin: const EdgeInsets.only(top: 40, bottom: 20),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpNameView(
                    email: email,
                    password: password,
                    whom: 'adult',
                  ),
                ));
              },
              height: 64,
              text: 'Me',
              textColor: dark,
              color: white,
              border: Border.all(color: borderGrey),
              borderRadius: 16,
            ),
            WButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpNameView(
                    email: email,
                    password: password,
                    whom: 'kid',
                  ),
                ));
              },
              height: 64,
              textColor: dark,
              color: white,
              text: 'My Child',
              border: Border.all(color: borderGrey),
              borderRadius: 16,
            ),
          ],
        ),
      ),
    );
  }
}
