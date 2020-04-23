import 'package:flutter/material.dart';

class LoadingIndicator {
  final BuildContext context;
  LoadingIndicator({this.context});

  void openLoadingScreen(){
    showGeneralDialog(
      context: this.context,
      barrierColor: Colors.white70,
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      pageBuilder: (_, __, ___) { // your widget implementation
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void closeLoadingScreen({bool param: false}){
    Navigator.of(this.context).pop(param);
  }
}