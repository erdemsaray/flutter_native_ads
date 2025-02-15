import '../exports/view_exports.dart';
import '../services/theme/theme_service.dart';

extension CustomThemeColors on ThemeData {
  Color themedColor({required Color lightColor, required Color darkColor}) {
    return ThemeService.instance.getTheme() == ThemeMode.light ? lightColor : darkColor;
  }

  // first color is for light theme, second color is for dark theme
  // color: Theme.of(context).firstWidgetColor -> for use
  Color get firstWidgetColor => themedColor(
        lightColor: ColorConstants.white,
        darkColor: ColorConstants.black,
      );
}
