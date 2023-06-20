import 'package:edu_platform/core/utils/constants.dart';
import 'package:edu_platform/features/connection_error/connection_error_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case connectionErrorPage:
        return navigateTo(const ConnectionErrorScreen());
      // case mainPage:
      //   return navigateTo(const MainScreen());
      // case orderInfoPage:
      //   Map<String, dynamic> fakeData = settings.arguments as Map<String, dynamic>;
      //   return navigateTo(OrderInfoScreen(fakeData: fakeData));

      // case noInternetRoute:
      //   return navigateTo(
      //       NoInternetScreen(voidCallback: settings.arguments as VoidCallback));

      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
      builder: (context) => widget,
    );
