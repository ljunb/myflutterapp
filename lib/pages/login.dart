import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  var accountErrMsg, passwordErrMsg;

  void _handleLogin() {
    // 做个简单的校验
    if (_accountController.text.length != 11) {
      setState(() {
        accountErrMsg = "Account.length == 11";
        passwordErrMsg = null;
      });
      return;
    } else if (_passwordController.text.length < 6 || _passwordController.text.length > 20) {
      setState(() {
        accountErrMsg = null;
        passwordErrMsg = "Password.length >= 6 && Password.length <= 20";
      });
      return;
    }
    setState(() {
      accountErrMsg = null;
      passwordErrMsg = null;
    });
    // 进入主页面
    Navigator.of(context).pushNamed('/tab_controller');
  }

  // 弹框提示
  void _showDialog(String msg) {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
        content: new Text(msg),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('Sure'),
          )
        ],
      )
    );
  }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                margin: const EdgeInsets.only(bottom: 15.0),
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _accountController,
                      maxLength: 11,
                      autofocus: true,
                      decoration: new InputDecoration(
                        // icon: new Icon(Icons.account_circle),
                        hintText: 'Your account...',
                        labelText: 'Account',
                        errorText: accountErrMsg
                      ),
                    ),
                    new TextField(
                      controller: _passwordController,
                      obscureText: true,
                      maxLength: 20,
                      onSubmitted: (text) { _handleLogin(); },
                      decoration: new InputDecoration(
                        // icon: new Icon(Icons.lock_outline),
                        hintText: 'Your passord...',
                        labelText: 'Password',
                        errorText: passwordErrMsg,
                      ),
                    )
                  ],
                ),
              ),
              new FlatButton(
                child: new Container(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  decoration: new BoxDecoration(
                    color: Theme.of(context).accentColor
                  ),
                  child: new Center(
                    child: new Text(
                      'Login',
                      style: new TextStyle(color: const Color(0xff000000)),
                    ),
                  ),
                ),
                onPressed: _handleLogin,
              )
            ],
          )
        )
      );
    }
}