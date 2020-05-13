import 'package:flutter/material.dart';
import 'package:shared_preferences_app/src/pages/home_page.dart';
import 'package:shared_preferences_app/src/pages/settings_page.dart';
import 'package:shared_preferences_app/src/preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _prefs = UserPreferences();
  await _prefs.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: this._prefs.getRuta,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => SettingsPage()
      },
    );
  }
}
