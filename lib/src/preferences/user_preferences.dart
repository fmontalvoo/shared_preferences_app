import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/src/pages/home_page.dart';

class UserPreferences {
  static final UserPreferences _preferences = UserPreferences._();
  SharedPreferences _prefs;

  UserPreferences._();

  factory UserPreferences() {
    return _preferences;
  }

  initPreferences() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  bool get getColor => this._prefs.getBool('color') ?? false;
  set setColor(bool value) => this._prefs.setBool('color', value);

  int get getGenero => this._prefs.getInt('genero') ?? 1;
  set setGenero(int value) => this._prefs.setInt('genero', value);

  String get getNombre => this._prefs.getString('nombre') ?? '';
  set setNombre(String value) => this._prefs.setString('nombre', value);

  String get getRuta => this._prefs.getString('ruta') ?? HomePage.routeName;
  set setRuta(String value) => this._prefs.setString('ruta', value);
}
