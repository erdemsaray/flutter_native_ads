import 'package:flutter/material.dart';
import '../../../common/views/app_view.dart';
import '../../constants/navigation/navigation_constants.dart';

// Router structure, add another arguments if you need
class NavigationRoute {
  NavigationRoute._init();

  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case NavigationConstants.root:
        return MaterialPageRoute(
          builder: (context) => const AppView(),
          settings: RouteSettings(arguments: args),
        );
    }
    return null;
  }
}

