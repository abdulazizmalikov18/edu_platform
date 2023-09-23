import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/auth/presentation/controllers/auth/authentication_bloc.dart';
import 'package:edu_platform/features/auth/presentation/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpNameView extends StatefulWidget {
  const SignUpNameView({
    super.key,
    required this.email,
    required this.password,
    required this.whom,
  });

  final String email;
  final String password;
  final String whom;

  @override
  State<SignUpNameView> createState() => _SignUpNameViewState();
}

class _SignUpNameViewState extends State<SignUpNameView> {
  late TextEditingController name;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    name = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Scaffold(
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
                    validate: (value) {
                      if (name.text.isEmpty) {
                        return "Name";
                      }
                      return null;
                    },
                    controller: name,
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
                  isLoading: state.status == AuthenticationStatus.loading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthenticationBloc>().add(
                            SignUpEmail(
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
                                        status:
                                            AuthenticationStatus.authenticated,
                                      ),
                                    );
                              },
                              email: widget.email,
                              password: widget.password,
                              name: name.text,
                              whom: widget.whom,
                            ),
                          );
                    }
                  },
                  text: 'Next',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
