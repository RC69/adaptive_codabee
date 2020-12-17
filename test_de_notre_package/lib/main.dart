import 'package:flutter/material.dart';
import 'package:adaptive_codabee/adaptive_codabee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
        string: "Notre package importé",
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Adaptive.text(
                    string: "Notre application s'adapte aotomatiquement",
                    color: Colors.red,
                    size: 25,
                    align: TextAlign.center
                ),
                Adaptive.button(
                    child: Adaptive.text(string: "Press me"),
                    onPressed: () {
                      /// Effectuer une action
                      print("test");
                    }),
                Adaptive.button(
                    child: Adaptive.text(string: "Montre l'alerte"),
                    onPressed: () {
                      Adaptive.alert(
                          context: context,
                          callback: () {
                            Navigator.of(context).pop();
                          }
                      );
                    }),
              ],
            )
        ),
    );
  }
}
