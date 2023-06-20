import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:edu_platform/features/tutors/presentation/controllers/bloc/tutors_bloc.dart';
import 'package:edu_platform/features/tutors/presentation/widgets/tutor_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class TutorsMainView extends StatefulWidget {
  const TutorsMainView({super.key});

  @override
  State<TutorsMainView> createState() => _TutorsMainViewState();
}

class _TutorsMainViewState extends State<TutorsMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TutorsBloc, TutorsState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              edgeOffset: 0,
              displacement: 100,
              onRefresh: () async {
                context.read<TutorsBloc>().add(GetTutors());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.tutorsList.length,
                itemBuilder: (context, index) => TutorIteam(
                  tutors: state.tutorsList[index],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: white,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: WTextField(
          onChanged: (value) {},
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
            child: SvgPicture.asset(
              AppIcons.search,
              colorFilter: const ColorFilter.mode(dark, BlendMode.srcIn),
            ),
          ),
          hintText: 'Search',
        ),
      ),
    );
  }
}
