import 'package:basic_scrolllist/service_locator.dart';
import 'package:basic_scrolllist/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Coding Challenge',
      theme: Theme.of(context).copyWith(
          accentIconTheme:
              Theme.of(context).accentIconTheme.copyWith(color: Colors.white),
          accentColor: Colors.amber,
          primaryColor: Colors.amber,
          primaryIconTheme:
              Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
          primaryTextTheme:
              Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.white),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.amber,
          )),
      home: SafeArea(child: HomeView()),
      debugShowCheckedModeBanner: false,
    );
  }
}
