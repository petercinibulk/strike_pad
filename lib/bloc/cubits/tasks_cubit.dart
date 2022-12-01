import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strike_pad/models/task.dart';

class TasksCubit extends Cubit<Map<String, Task>> {
  TasksCubit() : super({});

  void clear(Color color) {
    emit({});
  }

  void toggleStrike(String id) {
    Map<String, Task> tasks = Map.from(state);
    if (!tasks.keys.contains(id)) {
      throw Exception("Task with id $id does not exist");
    }
    tasks[id] = tasks[id]!.copyWith(strike: !tasks[id]!.strike);
    emit(tasks);
  }

  void remove(String id) {
    Map<String, Task> tasks = Map.from(state);
    if (!tasks.keys.contains(id)) {
      throw Exception("Task with id $id does not exist");
    }
    tasks.remove(id);
    emit(tasks);
  }

  void add(String text) {
    Map<String, Task> tasks = Map.from(state);
    Task newTask = Task(text: text);
    tasks[newTask.id] = newTask;
    emit(tasks);
  }
}
