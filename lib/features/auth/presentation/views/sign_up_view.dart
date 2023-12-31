import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/auth/presentation/views/login_view.dart';
import 'package:edu_platform/features/auth/presentation/views/sign_up_whom.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController _email;
  late TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Sign Up'),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                  validate: (value) {
                    if (value!.length < 8) {
                      return "Email";
                    } else {
                      return null;
                    }
                  },
                  controller: _email,
                  hintText: 'Example@domain.com',
                  keyBoardType: TextInputType.emailAddress,
                ),
              ),
              const Text('Password'),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                child: WTextField(
                  onChanged: (value) {},
                  validate: (value) {
                    if (value!.length < 8) {
                      return "Password";
                    } else {
                      return null;
                    }
                  },
                  controller: _password,
                  hintText: 'Your password',
                  keyBoardType: TextInputType.visiblePassword,
                ),
              ),
              WButton(
                margin: const EdgeInsets.only(bottom: 24),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpWhomView(
                        email: _email.text,
                        password: _password.text,
                      ),
                    ));
                  }
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
      ),
    );
  }
}
