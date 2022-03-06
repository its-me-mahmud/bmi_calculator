import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bmi_calculator/utils/utils.dart';

class BmiProvider extends ChangeNotifier {
  BmiProvider() {
    _loadPrefsData();
  }

  bool _isMaleSelected = true;
  bool _isFemaleSelected = false;
  int _height = 183;
  int _weight = 74;
  int _age = 19;
  double _bmi = 0;

  final String _maleKey = 'male';
  final String _femaleKey = 'female';
  final String _heightKey = 'height';
  final String _weightKey = 'weight';
  final String _ageKey = 'age';
  final String _bmiKey = 'bmi';

  late SharedPreferences _preferences;

  bool get isMaleSelected => _isMaleSelected;

  bool get isFemaleSelected => _isFemaleSelected;

  int get height => _height;

  int get weight => _weight;

  int get age => _age;

  double get bmi => _bmi;

  set isMaleSelected(bool isSelected) {
    _isMaleSelected = isSelected;
    notifyListeners();
  }

  set isFemaleSelected(bool isSelected) {
    _isFemaleSelected = isSelected;
    notifyListeners();
  }

  set height(int height) {
    _height = height;
    notifyListeners();
  }

  set weight(int weight) {
    _weight = weight;
    notifyListeners();
  }

  set age(int age) {
    _age = age;
    notifyListeners();
  }

  void incrementWeight() {
    _weight++;
    notifyListeners();
  }

  void decrementWeight() {
    if (_weight <= 1) return;
    _weight--;
    notifyListeners();
  }

  void incrementAge() {
    if (_age >= 120) return;
    _age++;
    notifyListeners();
  }

  void decrementAge() {
    if (_age <= 1) return;
    _age--;
    notifyListeners();
  }

  void calculateBmi() {
    _bmi = (_weight / _height / _height) * 10000;
    notifyListeners();
  }

  void saveBmi() {
    _savePrefsData();
  }

  Color getResultColor() {
    if (_bmi < 18.5) {
      return Styles.red;
    } else if (_bmi >= 18.5 && _bmi <= 25.5) {
      return Styles.green;
    } else if (_bmi >= 25.5 && _bmi <= 30) {
      return Styles.amber;
    } else {
      return Styles.red;
    }
  }

  String getResult() {
    if (_bmi < 18.5) {
      return Strings.lowText;
    } else if (_bmi >= 18.5 && _bmi <= 25.5) {
      return Strings.normalText;
    } else if (_bmi >= 25.5 && _bmi <= 30) {
      return Strings.highText;
    } else {
      return Strings.veryHighText;
    }
  }

  String getRange() {
    if (_bmi < 18.5) {
      return Strings.lowRange;
    } else if (_bmi >= 18.5 && _bmi <= 25.5) {
      return Strings.normalRange;
    } else if (_bmi >= 25.5 && _bmi <= 30) {
      return Strings.highRange;
    } else {
      return Strings.veryHighRange;
    }
  }

  String getRangeValue() {
    if (_bmi < 18.5) {
      return Strings.lowRangeValue;
    } else if (_bmi >= 18.5 && _bmi <= 25.5) {
      return Strings.normalRangeValue;
    } else if (_bmi >= 25.5 && _bmi <= 30) {
      return Strings.highRangeValue;
    } else {
      return Strings.veryHighRangeValue;
    }
  }

  String getDescription() {
    if (_bmi < 18.5) {
      return Strings.lowDescription;
    } else if (_bmi >= 18.5 && _bmi <= 25.5) {
      return Strings.normalDescription;
    } else if (_bmi >= 25.5 && _bmi <= 30) {
      return Strings.highDescription;
    } else {
      return Strings.veryHighDescription;
    }
  }

  _initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  _loadPrefsData() async {
    await _initPrefs();
    _isMaleSelected = _preferences.getBool(_maleKey) ?? _isMaleSelected;
    _isFemaleSelected = _preferences.getBool(_femaleKey) ?? _isFemaleSelected;
    _height = _preferences.getInt(_heightKey) ?? _height;
    _weight = _preferences.getInt(_weightKey) ?? _weight;
    _age = _preferences.getInt(_ageKey) ?? _age;
    _bmi = _preferences.getDouble(_bmiKey) ?? _bmi;
    notifyListeners();
  }

  _savePrefsData() async {
    await _initPrefs();
    _preferences.setBool(_maleKey, isMaleSelected);
    _preferences.setBool(_femaleKey, _isFemaleSelected);
    _preferences.setInt(_heightKey, _height);
    _preferences.setInt(_weightKey, _weight);
    _preferences.setInt(_ageKey, _age);
    _preferences.setDouble(_bmiKey, _bmi);
  }
}
