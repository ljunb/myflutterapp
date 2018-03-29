import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class DiscoveryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DiscoveryPageState();
  }
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final url = 'http://food.boohee.com/fb/v1/categories/list';
  final httpClient = new HttpClient();
  var foodGroup = new List();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var responseData = await request.close();
      if (responseData != null) {
        var json = await responseData.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        result = data['group'];
      } else {
        print('[Discovery] Fetch data failed!');
      }
    } catch (exception) {
      print('[Discovery] Fetch data error: $exception');
    }

    if (mounted) {
      setState(() {
        foodGroup = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final groupNameMap = {
      'group': '分类',
      'brand': '品牌',
      'restaurant': '餐馆',
    };

    List<Widget> _buildCategoryList(List categories) {
      return new List<Widget>.generate(categories.length, (int index) {
        var category = categories[index];
        return new ListTile(
          title: new Text(category['name']),
          leading: new Image.network(category['image_url']),
        );
      });
    }

    List<Widget> _buildCardList(var group) {
      var groupName = 'GroupName';
      if (groupNameMap.containsKey(group['kind'])) {
        groupName = groupNameMap[group['kind']];
      }
      return [
        new Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text(
            groupName,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        new Column(
          children: _buildCategoryList(group['categories']),
        )
      ];
    }

    return new Scaffold(
      body: new Center(
        child: new ListView.builder(
          itemCount: foodGroup.length,
          itemBuilder: (context, int index) {
            var group = foodGroup[index];
            return new SizedBox(
              child: new Card(
                  child: new Column(children: _buildCardList(group)
                )
              )
            );
          },
        ),
      ),
    );
  }
}
