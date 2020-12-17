library adaptive_codabee;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


class Adaptive {

  /// Check Platform
  static bool _isIOS() => (!Platform.isIOS);

  /// Material Design Adapted

  /// Fonction pour le Scaffold adapté
  static Widget scaffold({@required String string, @required Widget body}) {
    return (_isIOS())
        ? _iOSScaffold(string, body)
        : _androidScaffold(string, body);
  }

  /// Fonction pour le Text adapté
  static text({@required String string, Color color, double size, TextAlign align}) {
    TextStyle style = _textStyle(color: color, size: size);
    return (_isIOS())
        ? _iOSText(string, style, align)
        : _androidText(string, style, align);
  }

  /// Fonction pour le Bouton adapté
  static button({@required Widget child, @required VoidCallback onPressed}) {
    return (_isIOS())
        ? _iOSButton(child: child, onPressed: onPressed)
        : _androidRaisedButton(child: child, onPressed: onPressed);
}

  /// Fonction pour le Alert adapté
  static Future alert({@required BuildContext context, @required VoidCallback onPressed})  {
    return showDialog(
        context: context,
        builder: (context) {
          return _isIOS()
              ? _iOSErrorAlert(context: context, onPressed: onPressed)
              : _androidErrorAlert(context: context, onPressed: onPressed);
          }
    );
  }

  /// Android Material
  /// A ne pas intégreer directement ao code,
  /// mais plutôt utiliser les fonctions qui s'adaptent

  /// Scaffold Android
  static Scaffold _androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(title: Text(string),),
      body: body,
    );
  }

  /// Text Android
  static Text _androidText(@required String string, @required TextStyle style, TextAlign align) {
    return Text(
      string,
      textAlign: align,
      style: style,
    );
  }

  /// Button Android
  static RaisedButton _androidRaisedButton({@required Widget child, @required VoidCallback onPressed}) {
    return RaisedButton(onPressed: onPressed, child: child,);
  }

  /// Alert Android
  static _androidErrorAlert({@required BuildContext context, @required VoidCallback onPressed}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          text(string: "Une erreur est apparue"),
        ],
      ),
      actions: <Widget>[
        button(child: text(string: 'OK'), onPressed: onPressed)
      ],
    );
  }

  /// IOS Material
  /// A ne pas intégreer directement ao code,
  /// mais plutôt utiliser les fonctions qui s'adaptent

  /// Scaffold IOS
  static CupertinoPageScaffold _iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(string),),
        child: body
    );
  }

  /// Text IOS
  static DefaultTextStyle _iOSText(@required String string, @required TextStyle style, TextAlign align) {
    return DefaultTextStyle(
        style: style,
        child: Text(string, textAlign: align ?? TextAlign.left,)
    );
  }

  /// Button IOS
  static CupertinoButton _iOSButton({@required Widget child, @required VoidCallback onPressed}) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }

  ///  Alert IOS
  static _iOSErrorAlert({@required BuildContext context, @required VoidCallback onPressed}) {
    return CupertinoAlertDialog(
      content: Column(
        children: <Widget>[
          text(string: "Erreur")
        ],
      ),
      actions: <Widget>[
        button(child: text(string: "OK"), onPressed: onPressed)
      ],
    );
  }

  /// Both Material
  /// A ne pas intégreer directement ao code,
  /// mais plutôt utiliser les fonctions qui s'adaptent

  /// Style de Texte qui s'intégre aux textes IOS et Android
  static TextStyle _textStyle({Color color, double size, TextAlign align}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }

}