# introscreen

A IntroScreen package for Flutter.

## Getting Started

In your flutter project add the dependency:

```yml
dependencies:
  ...
  introscreen:
```

## Usage

Create instance of IntroScreen with parametres
1. **items** - List<Widgets> - list of you widgets
2. **navigateAfter** - widget to navigate after done or **onDonePressed** - callback function


## Usage example

Import `sqflite.dart`

```dart
import 'package:sqflite/sqflite.dart';
```

## Demo

```dart
import 'package:introscreen/introscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(items: [1,2,3,4,5].map<Widget>((int i){
        return Container(
          child: Center(
            child: Text(i.toString()),
          ),);
       }).toList(), navigateAfter: Main(),),
    );
  }
}


class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}

```

