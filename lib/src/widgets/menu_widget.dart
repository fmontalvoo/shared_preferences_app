import 'package:flutter/material.dart';

import 'package:shared_preferences_app/src/pages/home_page.dart';
import 'package:shared_preferences_app/src/pages/settings_page.dart';
import 'package:shared_preferences_app/src/preferences/user_preferences.dart';

class MenuWidget extends StatelessWidget {
  final String routeName;
  final UserPreferences prefs;

  const MenuWidget({Key key, this.routeName, this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu.jpg'), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text('Home'),
            onTap: () {
              _navigate(context, HomePage.routeName);
            },
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text('Settings'),
              onTap: () {
                _navigate(context, SettingsPage.routeName);
              }),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, String routeName) {
    if (this.routeName != routeName) {
      this.prefs.setRuta = routeName;
      Navigator.pushReplacementNamed(context, routeName);
    } else {
      Navigator.pop(context);
    }
  }
}
