import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout(BuildContext context) {
    SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    asyncPrefs.clear().then(
          (value) => Navigator.pushReplacementNamed(
            context,
            'login',
          ),
        );
  }