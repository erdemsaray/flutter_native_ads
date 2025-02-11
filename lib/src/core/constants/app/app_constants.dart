
import 'package:provider/provider.dart';

import '../../../common/view_models/app_view_model.dart';
import '../../../common/view_models/theme_view_model.dart';
import '../../../pages/home/home_view_model.dart';
import '../../../pages/settings/settings_view_model.dart';

class AppConstants {
  static const appName = 'AppName';
  static const fontFamily = 'fontFamily';

  static final providers = [
    ChangeNotifierProvider<AppViewModel>(
      create: (context) => AppViewModel(),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
    ),
    ChangeNotifierProvider<SettingsViewModel>(
      create: (context) => SettingsViewModel(),
    ),
    ChangeNotifierProvider<ThemeViewModel>(
      create: (context) => ThemeViewModel(),
    ),
  ];
}

