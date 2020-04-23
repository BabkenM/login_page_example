import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is dialog widget
// ignore: must_be_immutable
class WarningDialog extends StatelessWidget {
  String message;
  WarningDialog({@required this.message});

  /// Variable for accessing [AppThemes]
  ThemeData _theme;

  /// Returns [SimpleDialog] which contains a title, body message and button
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return SimpleDialog(
      backgroundColor: _theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      children: <Widget>[
        _bodyMessage(context),
        Divider(thickness: 1),
        _okButton(context),
      ],
    );
  }

  /// Returns centered [Text] widget with [Padding] for body message
  Widget _bodyMessage(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
            message,
            softWrap: true,
            textAlign: TextAlign.center,
            style: _theme.primaryTextTheme.subhead.copyWith(
              color: _theme.accentColor
            )
        ),
      ),
    );
  }

  /// Returns [RaisedButton] widget with [Padding] and [Text] widget
  /// [onPressed] callback function closing the screen keyboard and taking user
  /// to [AppRoutes.resetPassword] page
  Widget _okButton(BuildContext context){
    return Material(
      type: MaterialType.button,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "OK",
            textAlign: TextAlign.center,
            style: _theme.primaryTextTheme.button.copyWith(
              color: _theme.accentColor
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}