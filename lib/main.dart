import 'package:edu_platform/assets/themes/theme.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/core/utils/size_config.dart';
import 'package:edu_platform/features/auth/presentation/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:edu_platform/features/auth/presentation/views/auth_main.dart';
import 'package:edu_platform/features/common/repo/auth.dart';
import 'package:edu_platform/features/common/repo/storage_repository.dart';
import 'package:edu_platform/features/common/rout/rout.dart';
import 'package:edu_platform/features/courses/presentation/controllers/bloc/courses_bloc.dart';
import 'package:edu_platform/features/main/presentation/controllers/bloc/home_bloc.dart';
import 'package:edu_platform/features/main/presentation/views/main_view.dart';
import 'package:edu_platform/features/messages/presentation/controllers/bloc/chat_bloc.dart';
import 'package:edu_platform/features/splash/presentation/views/splash_sc.dart';
import 'package:edu_platform/features/tutors/presentation/controllers/bloc/tutors_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

import 'features/auth/presentation/controllers/auth/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  setupLocator();
  ZegoUIKit().initLog().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc(AuthRepository())..add(CheckUser())),
        BlocProvider(create: (context) => ShowPopUpBloc()),
        BlocProvider(create: (context) => CoursesBloc()),
        BlocProvider(create: (context) => TutorsBloc()),
        BlocProvider(create: (context) => ChatBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        navigatorKey: _navigatorKey,
        onGenerateRoute: (settings) => SplashSc.route(),
        builder: (context, child) {
          SizeConfig().init(context);
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              debugPrint('STATE LISTENER ============>1 ${state.status}');
              switch (state.status) {
                case AuthenticationStatus.unauthenticated:
                  navigator.pushAndRemoveUntil(fade(page: const AuthMain()), (route) => false);
                  break;
                case AuthenticationStatus.authenticated:
                  navigator.pushAndRemoveUntil(fade(page: const MainView()), (route) => false);
                  break;
                case AuthenticationStatus.loading:
                case AuthenticationStatus.cancelLoading:
                  break;
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
