import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.light);

  void toggleThemeMode() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
