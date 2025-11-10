import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'setting_view_model.dart';
import 'mytheme.dart';

class EcranSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingViewModel = Provider.of<SettingViewModel>(context);

    return Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.dark().scaffoldBackgroundColor,
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.light().scaffoldBackgroundColor,
        ),
        sections: [
          SettingsSection(
            title: const Text('Thème'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: settingViewModel.isDark,
                onToggle: (value) {
                  settingViewModel.isDark = value;
                  debugPrint('Thème changé : $value');
                },
                title: const Text('Dark Model'),
                leading: const Icon(Icons.invert_colors),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
