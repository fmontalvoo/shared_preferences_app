import 'package:flutter/material.dart';

import 'package:shared_preferences_app/src/preferences/user_preferences.dart';
import 'package:shared_preferences_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _prefs = UserPreferences();
  bool _color;
  int _genero;
  String _nombre;

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _color = this._prefs.getColor;
    _genero = this._prefs.getGenero;
    _nombre = this._prefs.getNombre;
    _textEditingController = TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: (this._prefs.getColor) ? Colors.teal : Colors.blue),
      drawer: MenuWidget(routeName: SettingsPage.routeName, prefs: this._prefs),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Ajustes', style: TextStyle(fontSize: 35))),
          Divider(),
          SwitchListTile(
              title: Text('Color de la interfaz'),
              value: _color,
              onChanged: _setSelectedSwitch),
          RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile(
              title: Text('Femenino'),
              value: 2,
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre del usuario'),
                onChanged: _setText),
          )
        ],
      ),
    );
  }

  void _setSelectedSwitch(bool value) {
    setState(() {
      _color = value;
      this._prefs.setColor = _color;
    });
  }

  void _setSelectedRadio(int value) {
    setState(() {
      _genero = value;
      this._prefs.setGenero = _genero;
    });
  }

  void _setText(String value) {
    setState(() {
      _nombre = value;
      this._prefs.setNombre = _nombre;
    });
  }
}
