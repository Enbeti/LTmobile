import 'package:bai_tap_lon/Widgets/Home.dart';
import 'package:bai_tap_lon/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(),
      routes: {
        //"login" : (context) => LoginPage(),
        //"register" : (context) => RegisterPage(),
        //"contact" : (context) => ContactPage(),
        //"favorite" : (context) => FavoritePage(),
        //"account" : (context) => AccountPage(),

      },
    );
  }
}