import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/features/auth/presentation/controllers/auth/authentication_bloc.dart';
import 'package:edu_platform/features/profile/presentation/views/account_settings.dart';
import 'package:edu_platform/features/profile/presentation/views/favourites_view.dart';
import 'package:edu_platform/features/profile/presentation/views/subscriptions_view.dart';
import 'package:edu_platform/features/profile/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMainView extends StatelessWidget {
  const ProfileMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return ListView(
            children: [
              Container(
                color: green,
                height: 102,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(64),
                        border: Border.all(width: 2, color: white),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'SA',
                        style: TextStyle(
                          color: white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.data.whom,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.user.data.email,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AccountView(),
                )),
                tileColor: white,
                leading: SvgPicture.asset(AppIcons.account),
                title: const Text('Account settings'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: dark,
                ),
                shape: const Border(
                    bottom: BorderSide(width: 1, color: dividerGrey)),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SubscriptionsView(),
                  ));
                },
                tileColor: white,
                leading: SvgPicture.asset(AppIcons.subscript),
                title: const Text('Subscriptions'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: dark,
                ),
                shape: const Border(
                    bottom: BorderSide(width: 1, color: dividerGrey)),
              ),
              ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavouritesView(),
                )),
                tileColor: white,
                leading: SvgPicture.asset(AppIcons.like),
                title: const Text('Favorites'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: dark,
                ),
                shape: const Border(
                    bottom: BorderSide(width: 1, color: dividerGrey)),
              ),
              ListTile(
                tileColor: white,
                leading: SvgPicture.asset(AppIcons.help),
                title: const Text('Help'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: dark,
                ),
                shape: const Border(
                    bottom: BorderSide(width: 1, color: dividerGrey)),
              ),
              ListTile(
                tileColor: white,
                leading: SvgPicture.asset(AppIcons.feedback),
                title: const Text('Feedback'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: dark,
                ),
                shape: const Border(
                    bottom: BorderSide(width: 1, color: dividerGrey)),
              ),
              ListTile(
                onTap: () {
                  logoutDialog(context);
                },
                tileColor: white,
                leading: SvgPicture.asset(AppIcons.logout),
                title: const Text('Logout'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: dark,
                ),
                shape: const Border(
                    bottom: BorderSide(width: 1, color: dividerGrey)),
              ),
            ],
          );
        },
      ),
    );
  }
}
