import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/icons.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/auth/presentation/controllers/auth/authentication_bloc.dart';
import 'package:edu_platform/features/courses/presentation/controllers/bloc/courses_bloc.dart';
import 'package:edu_platform/features/courses/presentation/views/courses_main_view.dart';
import 'package:edu_platform/features/main/presentation/views/calendar_view.dart';
import 'package:edu_platform/features/main/presentation/views/home_view.dart';
import 'package:edu_platform/features/messages/presentation/views/messages_main_view.dart';
import 'package:edu_platform/features/profile/presentation/views/profile_main.dart';
import 'package:edu_platform/features/tutors/presentation/controllers/bloc/tutors_bloc.dart';
import 'package:edu_platform/features/tutors/presentation/views/tutors_main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  List body = [
    const HomeView(),
    const TutorsMainView(),
    const CoursesMainView(),
    const MessagesMainView(),
    const ProfileMainView(),
  ];

  @override
  void initState() {
    context.read<CoursesBloc>().add(GetCourses());
    context.read<TutorsBloc>().add(GetTutors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: white,
            ),
            centerTitle: false,
            title: Image.asset(
              AppImages.eduPlatform,
              height: 16,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const CalendarView(),
                  ));
                },
                icon: SvgPicture.asset(AppIcons.calendar),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppIcons.notif),
              ),
            ],
          ),
          body: body[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            showUnselectedLabels: true,
            backgroundColor: white,
            selectedItemColor: green,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) => setState(() {
              currentIndex = value;
            }),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 0 ? AppIcons.main : AppIcons.mainUnSl,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 1 ? AppIcons.edu : AppIcons.eduUnSl,
                ),
                label: 'Tutors',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 2 ? AppIcons.play : AppIcons.playUnSl,
                ),
                label: 'Courses',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 3 ? AppIcons.messages : AppIcons.messagesUnSl,
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: currentIndex == 4 ? Border.all(color: green) : null,
                  ),
                  child: CircleAvatar(
                    backgroundColor: red,
                    child: Text(
                      'SA',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                label: state.user.data.whom,
              ),
            ],
          ),
        );
      },
    );
  }
}
