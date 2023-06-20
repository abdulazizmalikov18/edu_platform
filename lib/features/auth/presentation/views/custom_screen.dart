import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/features/auth/presentation/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;

  const CustomScreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ShowPopUpBloc, ShowPopUpState>(
        builder: (context, state) => Material(
          child: Stack(
            children: [
              // Positioned.fill(child: WKeyboardDismisser(child: child)),
              AnimatedPositioned(
                top: state.showPopUp
                    ? MediaQuery.of(context).padding.top + 12
                    : -(MediaQuery.of(context).padding.top + 12 + 56),
                left: 16,
                right: 16,
                duration: const Duration(milliseconds: 150),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 12, right: 8, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: statusBgColor(state.status),
                    border: Border.all(color: statusBorderColor(state.status)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: statusColor(state.status),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            statusIcon(state.status),
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                            height:
                                state.status == PopStatus.success ? 14 : null,
                          )),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          state.message,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: statusColor(state.status),
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.24),
                        ),
                      ),
                      const SizedBox(width: 8),
                      WScaleAnimation(
                        onTap: () {
                          context.read<ShowPopUpBloc>().add(HidePopUp());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.close_rounded,
                            color: statusColor(state.status),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  String statusIcon(PopStatus status) {
    switch (status) {
      case PopStatus.success:
        return AppIcons.warning;
      case PopStatus.error:
        return AppIcons.warning;
      case PopStatus.warning:
        return AppIcons.warning;
    }
  }

  Color statusBgColor(PopStatus status) {
    switch (status) {
      case PopStatus.success:
        return const Color(0xffECF8F3);
      case PopStatus.error:
        return const Color(0xffFAEEEE);
      case PopStatus.warning:
        return const Color(0xffFDF3E1);
    }
  }

  Color statusBorderColor(PopStatus status) {
    switch (status) {
      case PopStatus.success:
        return Colors.green;
      case PopStatus.error:
        return Colors.red;
      case PopStatus.warning:
        return Colors.orange;
    }
  }

  Color statusColor(PopStatus status) {
    switch (status) {
      case PopStatus.success:
        return Colors.green;
      case PopStatus.error:
        return Colors.red;
      case PopStatus.warning:
        return Colors.orange;
    }
  }
}
