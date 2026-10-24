import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppMode { customer, provider }

class AppState extends ChangeNotifier {
  String _lang = 'en';
  AppMode _mode = AppMode.customer;
  SharedPreferences? _prefs;

  String get lang => _lang;
  AppMode get mode => _mode;

  /// Providers are NEVER approved locally. Approval will come only from
  /// the server (admin action) in a later milestone.
  bool get providerApproved => false;

  Future<void> load() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _lang = _prefs?.getString('lang') == 'bn' ? 'bn' : 'en';
      _mode = _prefs?.getString('mode') == 'provider'
          ? AppMode.provider
          : AppMode.customer;
    } catch (_) {
      // Fall back to defaults if storage is unavailable.
    }
  }

  Future<void> setLang(String lang) async {
    _lang = lang == 'bn' ? 'bn' : 'en';
    notifyListeners();
    try {
      await _prefs?.setString('lang', _lang);
    } catch (_) {}
  }

  Future<void> setMode(AppMode mode) async {
    _mode = mode;
    notifyListeners();
    try {
      await _prefs?.setString('mode', mode.name);
    } catch (_) {}
  }
}
