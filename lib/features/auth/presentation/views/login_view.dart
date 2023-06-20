import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/auth/presentation/controllers/auth/authentication_bloc.dart';
import 'package:edu_platform/features/auth/presentation/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:edu_platform/features/auth/presentation/views/sign_up_view.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        title: const Text('Log in'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email'),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                child: WTextField(
                  onChanged: (value) {},
                  controller: _email,
                  hintText: 'Example@domain.com',
                ),
              ),
              const Text('Password'),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                child: WTextField(
                  onChanged: (value) {},
                  controller: _password,
                  hintText: 'Your password',
                ),
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return WButton(
                    margin: const EdgeInsets.only(bottom: 24),
                    isLoading: state.status == AuthenticationStatus.loading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthenticationBloc>().add(
                              LoginUser(
                                onError: (text) {
                                  var error = text;
                                  if (error.toLowerCase().contains('dio') ||
                                      error.toLowerCase().contains('type')) {
                                    error = 'Xatolk yuz berdi!';
                                  }
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                                        message: error,
                                        status: PopStatus.error,
                                        dismissible: false,
                                      ));
                                },
                                onSuccess: () {
                                  context.read<AuthenticationBloc>().add(
                                        AuthenticationStatusChanged(
                                            status: AuthenticationStatus
                                                .authenticated),
                                      );
                                },
                                email: _email.text,
                                password: _password.text,
                              ),
                            );
                      }
                    },
                    text: 'Log in',
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WScaleAnimation(
                    onTap: () {},
                    child: Text(
                      'Forget password?',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  WScaleAnimation(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ));
                    },
                    child: Text(
                      'Create new account',
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
                text: 'Sign in with Google',
                color: buttonGrey,
                textColor: dark,
              ),
              WButton(
                margin: const EdgeInsets.symmetric(vertical: 20),
                onTap: () {},
                text: 'Sign in with Facebook',
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
