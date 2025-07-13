import 'package:flutter/material.dart' show ColorScheme, Theme;
import 'package:flutter/widgets.dart';
import 'package:takyeebbak/features/page/onboarding_page/page/onboarding_page.dart';

import '../../features/page/main/ui/page/main_page.dart';
import '../error/no_routes_error.dart';
import 'routes.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static ColorScheme get theme {
    final context = navigatorKey.currentContext;
    if (context == null) {
      throw Exception('Navigator context is not available');
    }
    return Theme.of(context).colorScheme;
  }

  Route<dynamic> generateRoute(final RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case Routes.mainPage:
        page = const MainPage();
        break;

      case Routes.onboardingPage:
        page = const OnboardingPage();
        break;

      default:
        page = const NoRoutesError();
    }
    return _createPageRoute(page);
  }

  /// Creates a [PageRouteBuilder] with custom animations for the given [page].
  ///
  /// The transition includes a fade and slide effect, with the slide starting
  /// from the right edge of the screen. The transition duration is set to
  /// 200 milliseconds.

  PageRouteBuilder _createPageRoute(final Widget page) => PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (_, final animation, final _) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: page,
    ),
  );
}
