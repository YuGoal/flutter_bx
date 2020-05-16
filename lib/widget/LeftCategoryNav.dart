import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertaobao/model/category.dart';
import 'package:fluttertaobao/provide/child_category.dart';
import 'package:fluttertaobao/service/service_method.dart';
import 'package:provider/provider.dart';

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  int checkIndex = 0;

  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return (_leftInkWel(index));
        },
      ),
    );
  }

  //获取分类数据
  void _getCategory() async {
    await requestPost('getCategory').then((val) {
      var data = json.decode(val.toString());
      Category categoryBigListModelList = Category.fromJson(data);
      setState(() {
        list = categoryBigListModelList.data;
      });
      context.read<ChildCategory>().getChildCategory(list[0].bxMallSubDto);
    });

  }

  Widget _leftInkWel(int index) {
    bool isCheck = false;
    isCheck = (index == checkIndex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          checkIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        context.read<ChildCategory>().getChildCategory(childList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isCheck?Color.fromRGBO(236, 238, 239, 1.0):Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
