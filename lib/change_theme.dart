import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/theme_bloc.dart';
import 'bloc/theme_event.dart';

class ChangeThemePage extends StatefulWidget {
  final bool isCurrentThemeDark;

  const ChangeThemePage(this.isCurrentThemeDark);

  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  bool _isDarkMode;

  @override
  void initState() {
    _isDarkMode = widget.isCurrentThemeDark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Theme'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dark Mode:'),
            BlocListener<ThemeBloc, ThemeData>(
              listener: (context, state) {
                _isDarkMode = state == ThemeData.dark();
              },
              child: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  context
                      .bloc<ThemeBloc>()
                      .add(value ? DarkThemeEvent() : LightThemeEvent());
                  setState(() {
                    _isDarkMode = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
