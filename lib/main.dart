import 'package:flutter/material.dart';
import 'package:myflutterapp/login.dart';
import 'package:myflutterapp/shopcart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/shopcart': (BuildContext context) => new ShopCartPage(),
      },
    );
  }
}
