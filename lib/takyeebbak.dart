import 'package:flutter/material.dart' show MaterialApp, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takyeebbak/l10n/app_localizations.dart' show AppLocalizations;
import 'core/config/constants/app_constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TakyeebBak extends StatelessWidget {
  TakyeebBak(final AppRouter appRouter, {super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(final BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    splitScreenMode: true,
    child: MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      navigatorKey: AppRouter.navigatorKey,
      initialRoute: Routes.onboardingPage,
      onGenerateRoute: appRouter.generateRoute,
      themeAnimationCurve: Curves.easeInOutCirc,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      supportedLocales: const [
        // English (United States)
        Locale('en', 'US'),
        // Arabic (Saudi Arabia)
        Locale('ar', 'SA'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      localeListResolutionCallback: (locales, supportedLocales) =>
          locales?.firstWhere(
            (locale) => supportedLocales.contains(locale),
            orElse: () => const Locale('ar', 'SA'),
          ),
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: true,
          left: false,
          right: false,
          child: child!,
        );
      },
    ),
  );
}