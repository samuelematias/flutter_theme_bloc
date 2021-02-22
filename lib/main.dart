import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'bloc/theme_bloc.dart';
import 'change_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing hydratedBloc, we can also change
  // the default location of storage file.
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (BuildContext context, theme) => MaterialApp(
                title: 'Flutter Theme Demo',
                theme: theme,
                home: ChangeThemePage(theme == ThemeData.dark()),
              )),
    );
  }
}
