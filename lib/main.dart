import 'package:flutter/material.dart';

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
      home: new MyHomePage(title: 'Flutter ShopCart List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [
    {'name': '苹果', 'price': 10},
    {'name': '梨子', 'price': 20},
    {'name': '香蕉', 'price': 30},
    {'name': '西瓜', 'price': 40},
    {'name': '西红柿', 'price': 50}
  ];
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            var fruit = data[index];
            return new Container(
              padding: new EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              height: 50.0,
              decoration: const BoxDecoration(
                border: const Border(
                  bottom: const BorderSide(width: 0.1, color: Colors.grey)
                )
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    fruit['name'],
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  new Text(
                    '￥' + fruit['price'].toString(),
                    style: new TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            ); 
          },
        ),
      ),
    );
  }
}
