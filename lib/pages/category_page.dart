import 'package:flutter/material.dart';
import 'package:fluttertaobao/widget/LeftCategoryNav.dart';
import 'package:fluttertaobao/widget/RightCategoryNav.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('商品分类'),
          centerTitle: true,
        ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
              ],
            )
          ],
        ),
      )
    );
  }
}

//
