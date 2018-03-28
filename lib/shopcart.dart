import 'package:flutter/material.dart';

class ShopCartPage extends StatefulWidget {
  ShopCartPage({
    Key key,
    this.title = 'Flutter ShopCart Demo',
  }) : super(key: key);

  final String title;

  @override
  _ShopCartPageState createState() => new _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {

  void _decrement(var fruit) {
    setState(() {
      data.map((item) {
        if (item['id'] == fruit['id']) {
          item['count'] = num.parse(item['count']) - 1;
        }
        return item;
      });
      print(data);
    });
  }

  void _increment(var fruit) {
    setState(() {
      data.map((item) {
        if (item['id'] == fruit['id']) {
          item['count'] = num.parse(item['count']) + 1;
        }
      });
    });
  }

  var data = [
    {'id': 1, 'name': '苹果', 'price': 10, 'quantity': 13, 'count': 0},
    {'id': 2, 'name': '梨子', 'price': 20, 'quantity': 10, 'count': 0},
    {'id': 3, 'name': '香蕉', 'price': 30, 'quantity': 2, 'count': 0},
    {'id': 4, 'name': '西瓜', 'price': 40, 'quantity': 4, 'count': 0},
    {'id': 5, 'name': '西红柿', 'price': 50, 'quantity': 3, 'count': 0}
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
                  new Row(
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
                        '    价格：￥' + fruit['price'].toString(),
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new FlatButton(
                        child: new Text('-'),
                        onPressed: () { _decrement(fruit); },
                      ),
                      new Text(fruit['count'].toString()),
                      new FlatButton(
                        child: new Text('+'),
                        onPressed: () { _increment(fruit); } ,
                      )
                    ],
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