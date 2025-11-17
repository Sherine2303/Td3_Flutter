import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'UI/mytheme.dart';
import 'ViewModel/home.dart';
import 'UI/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'UI/mytheme.dart';

void main() {
  runApp(MyTD2App());
}

class MyTD2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Création du provider pour SettingViewModel
    return ChangeNotifierProvider(
      create: (_) {
        SettingViewModel settingViewModel = SettingViewModel();
        // getSettings est déjà appelé dans le constructeur
        return settingViewModel;
      },
      child: Consumer<SettingViewModel>(
        builder: (context, SettingViewModel notifier, child) {
          return MaterialApp(
            title: 'TD3',
            theme: MyTheme.light(),
            darkTheme: MyTheme.dark(),
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            home: Home(),
          );
        },
      ),
    );
  }
}