import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/auth/presentation/views/login_view.dart';
import 'package:edu_platform/features/auth/presentation/views/sign_up_view.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 8 * 5.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.loginSp),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 8 * 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent,white.withOpacity(.6), white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 32, 24),
              child: Text.rich(
                TextSpan(
                  text: 'Learn to communicate',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: green,
                      ),
                  children: [
                    TextSpan(
                      text: ' with native speakers in online English classes',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            WButton(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ));
              },
              text: 'Log in',
              color: white,
              textColor: dark,
              border: Border.all(color: borderGrey),
            ),
            WButton(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignUpView(),
                ));
              },
              text: 'Sign up for free',
            ),
          ],
        ),
      ),
    );
  }
}
