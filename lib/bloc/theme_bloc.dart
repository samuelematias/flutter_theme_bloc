import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'theme_event.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light());

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    if (event is LightThemeEvent) yield ThemeData.light();
    if (event is DarkThemeEvent) yield ThemeData.dark();
  }

  @override
  ThemeData fromJson(Map<String, dynamic> json) {
    try {
      if (json['light'] as bool) return ThemeData.light();
      return ThemeData.dark();
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, bool> toJson(ThemeData state) {
    try {
      return {'light': state == ThemeData.light()};
    } catch (_) {
      return null;
    }
  }
}
