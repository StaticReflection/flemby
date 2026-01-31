import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void setDarkMode() => emit(ThemeMode.dark);

  void setLightMode() => emit(ThemeMode.light);

  void setSystemMode() => emit(ThemeMode.system);
}
