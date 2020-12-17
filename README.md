# Adaptive Codabee

Apprendre à créer un package qui s'adapte selon l'OS utilisé.
Ce package est destiné à la création d'applications [Flutter](https://flutter.io)

![SreenShot](/screenshots/Screenshot_1608238179.png)

## Getting Started

Pour utiliser ce package, ajouter au `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  adaptive_codabee_rc: ^1.0.1
```


## Usage

Dans le fichier Dart, importer:

```dart
import 'package:adaptive_codabee_rc/adaptive_codabee_rc.dart';
```

Intégrer un Scaffold

```dart
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

```

## -- FOR TEST -- Do not use -- Udemy course --
## -- FOR TEST -- Do not use -- Udemy course --
## -- FOR TEST -- Do not use -- Udemy course --