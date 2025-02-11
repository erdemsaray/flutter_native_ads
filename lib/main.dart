import 'src/common/view_models/theme_view_model.dart';
import 'src/core/exports/view_exports.dart';
import 'src/core/generated/codegen_loader.g.dart';
import 'src/core/helpers/localization_helper.dart';
import 'src/core/services/navigation/navigation_route.dart';
import 'src/core/services/navigation/navigation_service.dart';
import 'src/core/services/services.dart';

void main() async {
  await Services.init();

  runApp(
    MultiProvider(
      providers: AppConstants.providers,
      child: EasyLocalization(
          useOnlyLangCode: true,
          supportedLocales: LocalizationHelper.instance.supportedLocales,
          fallbackLocale: LocalizationHelper.instance.defaultLocale,
          path: LocalizationHelper.instance.languageAssetsPath,
          assetLoader: const CodegenLoader(),
          child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
          designSize: const Size(393, 878), // default iPhone 13
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              title: AppConstants.appName,
              theme: ThemeConstants.lightTheme,
              darkTheme: ThemeConstants.darkTheme,
              debugShowCheckedModeBanner: false,
              themeMode: context.watch<ThemeViewModel>().themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              initialRoute: NavigationConstants.root,
              onGenerateRoute: NavigationRoute.instance.generateRoute,
              navigatorKey: NavigationService.instance.navigatorKey,
            );
          },
        ));
  }
}
