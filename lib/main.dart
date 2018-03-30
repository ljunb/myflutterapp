import 'package:flutter/material.dart';
import './tab_controller.dart';
import './pages/login.dart';
import './pages/shopcart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/tab_controller': (BuildContext context) => new TabControllerPage(),
        '/shopcart': (BuildContext context) => new ShopCartPage(),
      },
    );
  }
}
