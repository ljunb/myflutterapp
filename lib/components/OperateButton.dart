import 'package:flutter/material.dart';

class OperateButton extends StatelessWidget {
  OperateButton({
    Key key,
    this.count = 0,
    this.decreaseDisabled,
    this.increaseDisabled,
    this.onDecrease,
    this.onIncrease,
  });

  final int count;
  final bool decreaseDisabled;
  final bool increaseDisabled;
  final Function onDecrease;
  final Function onIncrease;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 30.0,
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.grey, width: 1.0),
        borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
      ),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              color: Colors.transparent,
              width: 30.0,
              child: new Center(
                child: new Text('-', style: new TextStyle(color: decreaseDisabled ? Colors.grey : Colors.black)),
              ),
            ),
            onTap: onDecrease,
          ),
          new Container(
            height: 30.0,
            width: 40.0,
            decoration: new BoxDecoration(
                border: new Border(
                  left: const BorderSide(width: 1.0, color: Colors.grey),
                  right: const BorderSide(width: 1.0, color: Colors.grey)
                )
              ),
            child: new Center(
              child: new Text(count.toString()),
            ),
          ),
          new GestureDetector(
            child: new Container(
              color: Colors.transparent,
              width: 30.0,
              child: new Center(
                child: new Text('+', style: new TextStyle(color: increaseDisabled ? Colors.grey : Colors.black)),
              ),
            ),
            onTap: onIncrease,
          )
        ],
      ),
    );
  }
}
