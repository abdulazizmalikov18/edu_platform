import 'package:edu_platform/features/tutors/presentation/controllers/bloc/tutors_bloc.dart';
import 'package:edu_platform/features/tutors/presentation/widgets/tutor_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    context.read<TutorsBloc>().add(GetFavoriteTutors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
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
                context.read<TutorsBloc>().add(GetFavoriteTutors());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.tutorsFavoriteList.length,
                itemBuilder: (context, index) => TutorIteam(
                  isFavorite: false,
                  tutors: state.tutorsFavoriteList[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
