import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryColorCubit extends Cubit<Color> {
  PrimaryColorCubit() : super(Colors.blue);

  void setColor(Color color) {
    emit(color);
  }
}
