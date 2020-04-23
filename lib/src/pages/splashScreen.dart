import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  /// Variable for accessing [AppThemes]
  ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Container(
      color: _theme.scaffoldBackgroundColor,
    );
  }
}