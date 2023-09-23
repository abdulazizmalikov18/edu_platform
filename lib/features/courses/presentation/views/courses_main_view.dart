import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:edu_platform/features/courses/presentation/controllers/bloc/courses_bloc.dart';
import 'package:edu_platform/features/courses/presentation/views/courses_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class CoursesMainView extends StatefulWidget {
  const CoursesMainView({super.key});

  @override
  State<CoursesMainView> createState() => _CoursesMainViewState();
}

class _CoursesMainViewState extends State<CoursesMainView> {
  @override
  Widget build(BuildContext context) {
    List<String> list = ['Beginner', '12 lesson'];
    return Scaffold(
      body: BlocBuilder<CoursesBloc, CoursesState>(
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
                context.read<CoursesBloc>().add(GetCourses());
              },
              child: ListView.builder(
                itemCount: state.courseList.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Coursesview(courseList: state.courseList[index]))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 288,
                    child: Column(
                      children: [
                        Container(
                          height: 184,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20)),
                            color: index == 0
                                ? Colors.yellow
                                : const Color(0xff8FF727),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                state.courseList[index].image,
                                errorListener: () =>
                                    const AssetImage(AppImages.userMult),
                              ),
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            height: 48,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                              itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: dark.withOpacity(.6),
                                ),
                                child: Text(
                                  list[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(color: whiteGrey),
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(20)),
                          ),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.courseList[index].name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.courseList[index].presentation,
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
