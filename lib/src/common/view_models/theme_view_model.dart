import '../../core/exports/view_exports.dart';
import '../../core/services/theme/theme_service.dart';

class ThemeViewModel with ChangeNotifier, BaseViewModel {
  final _themeService = ThemeService.instance;
  bool isDarkMode = ThemeService.instance.isSavedDarkMode();

  ThemeMode get themeMode => _themeService.getTheme();

  set themeMode(ThemeMode themeMode) => this.themeMode = themeMode;

  void changeTheme() {
    bool newValue = !_themeService.isSavedDarkMode();
    _themeService.changeTheme(newValue);
    isDarkMode = newValue;
    notifyListeners();
  }
}

