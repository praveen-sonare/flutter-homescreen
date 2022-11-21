import 'package:flutter/material.dart';
import 'package:flutter_homescreen/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const navBarColor = const Color(0xff181818);
    const navBarIconColor = Colors.white;

    return MaterialApp(
      title: 'Homescreen',
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: navBarColor,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
              color: navBarIconColor,
            )),
            iconTheme: MaterialStateProperty.all(const IconThemeData(
              color: navBarIconColor,
            ))),
      ),
      home: Homescreen(),
    );
  }
}
