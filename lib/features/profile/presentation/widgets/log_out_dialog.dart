 import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/auth/presentation/controllers/auth/authentication_bloc.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Do you want to log out of your account?'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: WButton(
                      onTap: () {
                        context.read<AuthenticationBloc>().add(Logout());
                      },
                      text: 'Yes',
                      color: red,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: WButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      text: 'No',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
