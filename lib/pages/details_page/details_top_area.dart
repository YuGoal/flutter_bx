import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //商品图片
  Widget _goodsImage(url){
    return  Image.network(
        url,
        width:ScreenUtil().setWidth(740)
    );

  }

  //商品名称
  Widget _goodsName(name){

    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }

  Widget _goodsNum(num){
    return  Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      margin: EdgeInsets.only(top:8.0),
      child: Text(
        '编号:${num}',
        style: TextStyle(
            color: Colors.black26
        ),
      ),

    );
  }
}
