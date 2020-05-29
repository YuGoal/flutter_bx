import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertaobao/model/details.dart';
import 'package:fluttertaobao/provide/details_info.dart';
import 'package:fluttertaobao/service/service_method.dart';
import 'package:provider/provider.dart';
import './details_page/details_explain.dart';
import 'details_page/details_top_area.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context, goodsId);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('返回上一页');
              Navigator.pop(context);
            },
          ),
          title: Text('商品详细页'),
        ),
        body: Container(
            child: Row(
          children: <Widget>[
            DetailsTopArea(),
            DetailsExplain(),
          ],
        )));
  }

  void _getBackInfo(BuildContext context, String id) async {
    var formData = {'goodId': id};
    await requestPost('getGoodDetailById', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      Details details = Details.fromMap(responseData);
      context.read<DetailsInfoProvide>().getGoodsDetails(details);
      print(val.toString());
    });
  }
}
