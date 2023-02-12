import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitopia/presentation/resources/app_theme.dart';
import 'package:flutter/material.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ///Super select initialize light theme.
  ThemeBloc()
      : super(ThemeState(
            themeData: AppThemes.appThemeData[AppTheme.lightTheme]!)) {
    ///"on" always check Event which event come which event not come
    on<ThemeEvent>((event, emit) {
      // ignore: unnecessary_type_check
      if (event is ThemeEvent) {
        print("Change Theme event calls....");
        print(event);
        print(state);
        emit.call(
            ThemeState(themeData: AppThemes.appThemeData[event.appTheme]!));
      }
    });
  }
}
