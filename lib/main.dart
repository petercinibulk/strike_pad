import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:strike_pad/bloc/cubits/primary_color_cubit.dart';
import 'package:strike_pad/bloc/cubits/tasks_cubit.dart';
import 'package:strike_pad/bloc/cubits/theme_mode_cubit.dart';
import 'package:strike_pad/view/pages/home_page.dart';
// import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: await getTemporaryDirectory(),
  // );
  runApp(const Providers());
}

class Providers extends StatelessWidget {
  const Providers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeModeCubit(),
        ),
        BlocProvider(
          create: (context) => PrimaryColorCubit(),
        ),
        BlocProvider(
          create: (context) => TasksCubit(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<PrimaryColorCubit, Color>(
          builder: (context, primaryColor) {
            return MaterialApp(
              title: 'StrikePad',
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.light,
                colorSchemeSeed: primaryColor,
                // textTheme: GoogleFonts.notoSansTextTheme(),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
                colorSchemeSeed: primaryColor,
              ),
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
