import '../../core/exports/view_exports.dart';
import '../../core/services/theme/theme_service.dart';

class SettingsViewModel with ChangeNotifier, BaseViewModel {
  bool isDarkMode = ThemeService.instance.isSavedDarkMode();

  void updateTheme(bool isDarkMode) {
    ThemeService.instance.changeTheme(isDarkMode);
  }
}
