library adaptive_codabee;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


class Adaptive {

  // Check Platform
  static bool isIOS() => (!Platform.isIOS);

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

  // Both Material
  static TextStyle textStyle({Color color, double size, TextAlign align}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,


    );


  }

}