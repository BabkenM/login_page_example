import 'package:flutter/material.dart';
import 'package:viveohealthtask/src/base/routes.dart';
import 'package:viveohealthtask/src/base/themes.dart';
import 'package:viveohealthtask/src/pages/login.dart';
import 'package:viveohealthtask/src/pages/splashScreen.dart';

/// Root widget of the app.
///
/// Initializes the app, sets the title, loads localizations,
/// sets the app theme, defines the routes
class AppAuthEntry extends StatefulWidget {
  @override
  _AppAuthEntryState createState() => _AppAuthEntryState();
}

class _AppAuthEntryState extends State<AppAuthEntry> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return MediaQuery(
          child: widget,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      initialRoute: AppRoutes.login,
      onGenerateRoute: _getRoute,
      // Uses theme provided in AppThemes class
      theme: AppThemes.appTheme,
    );
  }

  /// This method working as middleware
  /// Get route settings from [onGenerateRoute]
  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return _buildRoute(settings, SplashScreen());
      case AppRoutes.login:
        return _buildRoute(settings, LoginPage());
      default:
        return _buildRoute(settings, LoginPage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}