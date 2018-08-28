import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'widgets.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  int promoAmount = 0;
  Color color;

  @override
  void initState() {
    super.initState();
    promotions.listen((int amount) => setState(() => promoAmount = amount));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('小店'),
        leading: IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: () => setState(() => color = getRandomColor())),
      ),
      body: Column(
        children: <Widget>[
          MyCard(
              height: 240.0,
              color: Colors.blue[600],
              child: Stack(children: <Widget>[Label('新货')])),
          SizedBox(
              height: 150.0,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                MyCard(
                    width: 120.0, color: Colors.red[700], child: Label('家具')),
                MyCard(width: 200.0, color: Colors.green, child: Label('唱片')),
                MyCard(
                    width: 160.0, color: Colors.amber[600], child: Label('单车')),
                MyCard(width: 240.0, color: Colors.teal, child: Label('眼镜')),
              ])),
          MyCard(
              height: 160.0,
              color: Colors.indigo,
              child: Stack(children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 7.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(promoAmount.toString()))),
                Label('抢购!')
              ])),
        ],
      ),
    );
  }
}
