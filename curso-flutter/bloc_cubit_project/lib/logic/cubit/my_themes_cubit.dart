import 'package:bloc_cubit_project/themes/my_themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyThemeCubit extends Cubit<ThemeData> {
  MyThemeCubit() : super(MyThemes.getTheme('default'));

  void changeTheme(String genre) {
    emit(
      MyThemes.getTheme(
        genre,
      ),
    );
  }
}
