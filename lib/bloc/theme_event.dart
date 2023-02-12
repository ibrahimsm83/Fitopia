part of 'theme_bloc.dart';

// abstract class ThemeEvent extends Equatable {
//   const ThemeEvent();
// }

// class ThemeChanged extends ThemeEvent {
//   final AppTheme apptheme;

//   ThemeChanged({required this.apptheme});
//   @override
//   List<Object?> get props => [apptheme];
// }

class ThemeEvent {
  final AppTheme appTheme;
  ThemeEvent({required this.appTheme});

  
}
