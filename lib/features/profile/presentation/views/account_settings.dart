import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/auth/presentation/controllers/auth/authentication_bloc.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:edu_platform/features/profile/presentation/widgets/show_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account settings'),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            children: [
              WScaleAnimation(
                onTap: () {
                  showEditor(context,
                      title: 'First name', hintText: state.user.data.whom);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: dividerGrey),
                  ),
                  child: ListTile(
                    title: const Text('First name'),
                    subtitle: Text(
                      state.user.data.whom,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: dark,
                    ),
                  ),
                ),
              ),
              WScaleAnimation(
                onTap: () {
                  showEditor(context,
                      title: 'Last name', hintText: state.user.data.firstname);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: dividerGrey),
                  ),
                  child: ListTile(
                    title: const Text('Last name'),
                    subtitle: Text(
                      state.user.data.firstname,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: dark,
                    ),
                  ),
                ),
              ),
              WScaleAnimation(
                onTap: () {
                  showEditor(context,
                      title: 'Email', hintText: state.user.data.email);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: dividerGrey),
                  ),
                  child: ListTile(
                    title: const Text('Email'),
                    subtitle: Text(
                      state.user.data.email,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: dark,
                    ),
                  ),
                ),
              ),
              WScaleAnimation(
                onTap: () {
                  showEditor(context, title: 'Password', hintText: '********');
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: dividerGrey),
                  ),
                  child: const ListTile(
                    title: Text('Password'),
                    subtitle: Text(
                      '********',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: dark,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
