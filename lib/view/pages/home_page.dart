import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strike_pad/bloc/cubits/theme_mode_cubit.dart';
import 'package:strike_pad/view/components/task_list.dart';
import 'package:strike_pad/view/dialogs/color_picker_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StrikePad"),
        actions: [
          BlocBuilder<ThemeModeCubit, ThemeMode>(builder: (context, state) {
            return IconButton(
              onPressed: context.read<ThemeModeCubit>().toggleThemeMode,
              icon: Icon(state == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.dark_mode),
            );
          })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Delete',
        child: const Icon(Icons.delete_forever),
      ),
    );
  }
}
