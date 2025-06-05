import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lighttheme);

  static final _lighttheme = ThemeData.light();
  static final _darktheme = ThemeData.dark();

  void toggleTheme() => emit(state == _lighttheme ? _darktheme : _lighttheme);
}
