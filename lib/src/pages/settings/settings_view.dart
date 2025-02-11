import 'dart:developer';

import '../../common/view_models/theme_view_model.dart';
import '../../core/exports/view_exports.dart';
import 'widgets/settings_item.dart';
import 'widgets/settings_switch_item.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: Text(
        LocaleKeys.settings.tr(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsItem(
                title: LocaleKeys.profile.tr(),
                onTap: () {
                  log("message");
                }),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h), // Adjusted for iPhone 13
              child: Column(
                children: [
                  SettingsSwitchItem(
                    title: LocaleKeys.notifications.tr(),
                    onChanged: (value) {},
                    switchValue: false,
                  ),
                  SettingsSwitchItem(
                      switchValue: context.watch<ThemeViewModel>().isDarkMode,
                      title: LocaleKeys.darkMode.tr(),
                      onChanged: (value) {
                        context.read<ThemeViewModel>().changeTheme();
                      }),
                  SettingsItem(title: LocaleKeys.language.tr(), onTap: null),
                ],
              ),
            ),
            SettingsItem(title: LocaleKeys.rateUs.tr(), onTap: null),
            SettingsItem(title: LocaleKeys.sendFeedback.tr(), onTap: null),
            SettingsItem(title: LocaleKeys.about.tr(), onTap: null),
          ],
        ),
      ),
    );
  }
}
