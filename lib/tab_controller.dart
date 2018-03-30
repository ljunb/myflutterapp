import 'package:flutter/material.dart';
import './pages/shopcart.dart';
import './pages/discovery.dart';
import './pages/mine.dart';

class TabControllerPage extends StatefulWidget {
  @override
  _TabControllerPageState createState() => new _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> with SingleTickerProviderStateMixin {
  TabController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        title: new TabBar(
          tabs: <Tab>[
            new Tab(text: 'Home'),
            new Tab(text: 'Discovery'),
            new Tab(text: 'Mine')
          ],
          controller: _controller,
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          new ShopCartPage(),
          new DiscoveryPage(),
          new MinePage()
        ],
        controller: _controller,
      )
    );
  }
}