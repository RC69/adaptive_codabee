library adaptive_codabee;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


class Adaptive {

  // Check Platform
  static bool isIOS() => (Platform.isIOS);

  // Material Design Adapted
  static Widget scaffold({@required String string, @required Widget body}) {
    return (isIOS()) 
        ? iOSScaffold(string, body)
        : androidScaffold(string, body);
  }

  static text({@required String string, Color color, double size, TextAlign align}) {
    TextStyle style = textStyle(color: color, size: size);
    return (isIOS())
        ? iOSText(string, style, align)
        : androidText(string, style, align);
  }

  static Future alert({@required BuildContext context})  {
    return showDialog(
        context: context,
        builder: (context) {
          return isIOS()
              ? iOSErrorAlert(context: context)
              : androidErrorAlert(context: context);
          }
    );
  }

  // Android Material
  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(title: Text(string),),
      body: body,
    );
  }

  static Text androidText(@required String string, @required TextStyle style, TextAlign align) {
    return Text(
      string,
      style: style,
    );
  }

  static androidErrorAlert({@required BuildContext context}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          text(string: "Une erreur est apparue"),
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          child: text(string: 'OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }



  // IOS Material
  static CupertinoPageScaffold iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(string),),
        child: body
    );
  }

  static DefaultTextStyle iOSText(@required String string, @required TextStyle style, TextAlign align) {
    return DefaultTextStyle(
        style: style,
        child: Text(string, textAlign: align ?? TextAlign.left,)
    );
  }

  static iOSErrorAlert({@required BuildContext context}) {
    return CupertinoAlertDialog(
      content: Column(
        children: <Widget>[
          text(string: "Erreur")
        ],
      ),
      actions: <Widget>[
        CupertinoButton(
            child: text(string: 'OK'),
            onPressed: () {
              Navigator.of(context).pop();
            }
        )
      ],
    );
  }

  // Both Material
  static TextStyle textStyle({Color color, double size, TextAlign align}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }

}