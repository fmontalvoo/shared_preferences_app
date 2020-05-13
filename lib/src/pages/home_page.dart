import 'package:flutter/material.dart';
import 'package:shared_preferences_app/src/preferences/user_preferences.dart';

import 'package:shared_preferences_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Prefencias de Usuario'),
          backgroundColor: (this._prefs.getColor) ? Colors.teal : Colors.blue),
      drawer: MenuWidget(routeName: routeName, prefs: this._prefs),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color interfaz: ${this._prefs.getColor}'),
          Divider(),
          Text('Género: ${this._prefs.getGenero}'),
          Divider(),
          Text('Nombre: ${this._prefs.getNombre}'),
          Divider()
        ],
      ),
    );
  }
}
