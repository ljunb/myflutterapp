import 'package:flutter/material.dart';
import '../components/OperateButton.dart';

class ShopCartPage extends StatefulWidget {
  ShopCartPage({
    Key key,
    this.title = 'Flutter ShopCart Demo',
  })
      : super(key: key);

  final String title;

  @override
  _ShopCartPageState createState() => new _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {
  /// 删除商品
  void _decrement(var fruit) {
    setState(() {
      data.forEach((item) {
        int oldCount = num.parse(item['count'].toString());
        if (item['id'] == fruit['id'] && oldCount > 0) {
          item['count'] = --oldCount;
        }
      });
    });
  }

  /// 增加商品
  void _increment(var fruit) {
    setState(() {
      data.forEach((item) {
        int quantity = num.parse(item['quantity'].toString());
        int oldCount = num.parse(item['count'].toString());
        if (item['id'] == fruit['id'] && quantity > oldCount) {
          item['count'] = ++oldCount;
        }
      });
    });
  }

  /// 当前商品是否可加
  bool _hasNoQuantity(Map fruit) {
    var flag = false;
    data.forEach((item) {
      int quantity = num.parse(item['quantity'].toString());
      int oldCount = num.parse(item['count'].toString());
      if (item['id'] == fruit['id'] && quantity == oldCount) {
        flag = true;
        return;
      }
    });
    return flag;
  }

  /// 当前商品是否可减
  bool _hasNoCount(Map fruit) {
    var flag = false;
    data.forEach((item) {
      int oldCount = num.parse(item['count'].toString());
      if (item['id'] == fruit['id'] && oldCount == 0) {
        flag = true;
        return;
      }
    });
    return flag;
  }

  /// 总价格
  num _totalPrice() {
    var total = 0;
    data.forEach((item) {
      total += num.parse(item['count'].toString()) *
          num.parse(item['price'].toString());
    });
    return total;
  }

  /// 点击【全选】
  void _handleSelectAll() {
    setState(() {
      data.forEach((item) {
        int quantity = num.parse(item['quantity'].toString());
        item['count'] = quantity;
      });
    });
  }

  /// 是否已经全选
  bool _isSelectedAll() {
    bool flag = true;
    data.forEach((item) {
      int quantity = num.parse(item['quantity'].toString());
      int count = num.parse(item['count'].toString());
      if (quantity != count) {
        flag = false;
        return;
      }
    });
    return flag;
  }

  // mock
  var data = [
    {'id': 1, 'name': '苹果', 'price': 10, 'quantity': 13, 'count': 0},
    {'id': 2, 'name': '梨子', 'price': 20, 'quantity': 10, 'count': 0},
    {'id': 3, 'name': '香蕉', 'price': 30, 'quantity': 2, 'count': 0},
    {'id': 4, 'name': '西瓜', 'price': 40, 'quantity': 4, 'count': 0},
    {'id': 5, 'name': '西红柿', 'price': 50, 'quantity': 3, 'count': 0}
  ];

  /// 渲染商品操作按钮
  /// * [title]，按钮标题
  /// * [callback]，按钮点击事件回调
  Widget _buildOperateButton(String title, Function callback, bool disabled) {
    return new FlatButton(
      child: new Container(
        child: new Text(title,
            style: new TextStyle(color: disabled ? Colors.grey : Colors.black)),
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        decoration: new BoxDecoration(
          border: new Border.all(width: 0.2, color: Colors.grey),
        ),
      ),
      onPressed: disabled ? null : callback,
    );
  }

  /// 渲染商品列表
  Widget _buildShopCartList() {
    return new ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, int index) {
        var fruit = data[index];
        var quantity = num.parse(fruit['quantity'].toString());
        var count = num.parse(fruit['count'].toString());

        return new Container(
          padding: new EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          height: 60.0,
          decoration: const BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(width: 0.1, color: Colors.grey))),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    fruit['name'],
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        '价格：￥' + fruit['price'].toString(),
                        style:
                            new TextStyle(fontSize: 13.0, color: Colors.grey),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: new Text(
                          '剩余库存：' + (quantity - count).toString(),
                          style: new TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              new OperateButton(
                count: fruit['count'],
                decreaseDisabled: _hasNoCount(fruit),
                increaseDisabled: _hasNoQuantity(fruit),
                onDecrease: (){ _decrement(fruit); },
                onIncrease: (){ _increment(fruit); },
              )
            ],
          ),
        );
      },
    );
  }

  /// 渲染底部工具条
  Widget _buildBottomBar() {
    return new Positioned(
      left: 0.0,
      bottom: 0.0,
      right: 0.0,
      child: new Container(
        height: 50.0,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: const BoxDecoration(
            border: const Border(
                top: const BorderSide(width: 0.5, color: Colors.grey))),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  '总价：',
                  style: new TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                new Text("￥${_totalPrice()}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.red)),
              ],
            ),
            new FlatButton(
              color: Colors.red,
              disabledColor: Colors.grey,
              child: new Text('全选',
                  style: new TextStyle(
                      color: _isSelectedAll()
                          ? const Color(0xffdddddd)
                          : Colors.white)),
              onPressed: _isSelectedAll() ? null : _handleSelectAll,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Stack(
        children: <Widget>[
          _buildShopCartList(),
          _buildBottomBar(),
        ],
      )),
    );
  }
}
