import 'package:flutter/material.dart';
import 'package:fluttertaobao/provide/details_info.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Container(child: Text('商品ID为：${goodsId}'));
  }

  void _getBackInfo(BuildContext context) async {
    await Provider.of<DetailsInfoProvide>(context).getGoodsDetails(goodsId);
    print('加载完成...');
  }
}
