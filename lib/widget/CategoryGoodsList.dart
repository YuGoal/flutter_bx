import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertaobao/model/mallgoods.dart';
import 'package:fluttertaobao/service/service_method.dart';
import 'package:provider/provider.dart';
import '../provide/CategoryGoodsListProvide.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List<CategoryListData> list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(1000),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _ListWidget(index);
        },
      ),
    );
  }

  Widget _goodsImage(index) {
    return Container(
      child: Image.network(list[index].image),
      width: ScreenUtil().setWidth(200),
    );
  }

  Widget _goodsName(index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodsPrice(index) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Text(
              '价格:￥${list[index].presentPrice}',
              style: TextStyle(
                  color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
            ),
            Text(
              '￥${list[index].oriPrice}',
              style: TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ));
  }

  Widget _ListWidget(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            _goodsImage(index),
            Column(
              children: <Widget>[
                _goodsName(index),
                _goodsPrice(index),
              ],
            )
          ],
        ),
      ),
    );
  }

  //得到商品列表数据
  void _getGoodList({String categoryId, String categorySubId}) async {
    var data = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };

    await requestPost('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      Mallgoods mallgoods = Mallgoods.fromMap(data);
      Provider.of<CategoryGoodsListProvide>(context).getGoodsList(mallgoods.data);
    });
  }
}


