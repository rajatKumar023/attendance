import 'dart:convert';
import 'package:attendance_portal/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService._();

  factory PreferencesService.getInstance() => _instance;

  static final PreferencesService _instance = PreferencesService._();

  static const String LOGGED_IN_USER = 'logged_in_user';

  BuildContext _context;

  void setGlobalContext(BuildContext context) {
    _context = context;
  }

  TargetPlatform getTargetPlatform() {
    return Theme.of(_context).platform;
  }

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<void> setAuthUser(User user) async {
    if (user != null) {
      (await _getInstance()).setString(
          PreferencesService.LOGGED_IN_USER, json.encode(User.toJson(user)));
    } else {
      (await _getInstance())
          .setString(PreferencesService.LOGGED_IN_USER, user.toString());
    }
  }

  Future<User> getAuthUser() async {
    final String user =
    (await _getInstance()).getString(PreferencesService.LOGGED_IN_USER);
    if (user == null) {
      return null;
    }
    return User.fromJson(json.decode(user));
  }

  Future<void> removeAuthUser() async {
    (await _getInstance()).setString(PreferencesService.LOGGED_IN_USER, null);
  }
}
