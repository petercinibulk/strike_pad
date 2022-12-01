import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strike_pad/bloc/cubits/tasks_cubit.dart';
import 'package:strike_pad/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<TasksCubit, Map<String, Task>>(
          builder: (context, state) => Column(
            children: [
              ...state.values.map(
                (task) => TaskItem(task: task),
              ),
            ],
          ),
        ),
        NewTaskItem()
      ],
    );
  }
}

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListTile(
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          task.text,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                decorationThickness: 2,
                decoration: task.strike ? TextDecoration.lineThrough : null,
              ),
        ),
        onTap: () => context.read<TasksCubit>().toggleStrike(task.id),
      ),
    );
  }
}

class NewTaskItem extends StatelessWidget {
  NewTaskItem({Key? key}) : super(key: key);
  final focusNode = FocusNode();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextField(
          maxLines: 1,
          controller: textController,
          decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              helperText: null,
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: "Add a new item"),
          textInputAction: TextInputAction.done,
          focusNode: focusNode,
          onSubmitted: (value) {
            context.read<TasksCubit>().add(value);
            textController.clear();
            focusNode.requestFocus();
          },
        ),
      ),
    );
  }
}
