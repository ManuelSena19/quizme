import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light =
    ThemeData(brightness: Brightness.light, primarySwatch: Colors.lightBlue);

ThemeData dark =
    ThemeData(brightness: Brightness.dark, primarySwatch: Colors.lightBlue);

class ThemeNotifier extends ChangeNotifier{
    final String key = "theme";
    late SharedPreferences _pref;
    bool _darkTheme = true;
    bool get darkTheme => _darkTheme;

    ThemeNotifier() {
        _darkTheme = true;
        _loadFromPrefs();
    }
    toggleTheme(){
        _darkTheme = !_darkTheme;
        _saveToPrefs();
        notifyListeners();
    }

    _initPrefs() async {
        _pref = await SharedPreferences.getInstance();
    }

    _loadFromPrefs() async {
        await _initPrefs();
        _darkTheme = _pref.getBool(key) ?? true;
        notifyListeners();
    }

    _saveToPrefs() async {
        await _initPrefs();
        _pref.setBool(key, _darkTheme);
    }
}
