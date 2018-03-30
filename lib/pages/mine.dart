import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MinePageState();
  }
}

class _MinePageState extends State<MinePage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2000), 
      vsync: this
    );
    animation = new Tween(begin: 0.0, end: 300.0).animate(_controller)
    ..addListener(() {
      setState(() {

      });
    });
    _controller.forward();
  }

  @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        color: Colors.red,
      ),
    );
  }
}
