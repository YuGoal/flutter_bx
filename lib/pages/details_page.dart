import 'package:flutter/material.dart';
import 'package:fluttertaobao/provide/details_info.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('商品详情页'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context) ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Container(
              child: Column(
                children: <Widget>[],
              ),
            );
          }else{
            return Text('加载中........');
          }
        },
      ),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provider.of<DetailsInfoProvide>(context).getGoodsDetails(goodsId);
    print('加载完成...');
  }
}
