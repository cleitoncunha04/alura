// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SelectedIcon extends ChangeNotifier {
  IconData? selectedIcon;

  SelectedIcon({
    this.selectedIcon,
  });

  void choose(IconData? icon) {
    selectedIcon = icon;

    notifyListeners();
  }
}
