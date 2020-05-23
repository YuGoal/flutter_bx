import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertaobao/model/category.dart';
import 'package:fluttertaobao/model/mallgoods.dart';
import 'package:fluttertaobao/provide/CategoryGoodsListProvide.dart';
import 'package:fluttertaobao/provide/child_category.dart';
import 'package:fluttertaobao/service/service_method.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
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
                  CategoryGoodsList(),
                ],
              )
            ],
          ),
        ));
  }
}

//左侧大类
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
    _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _CategoryGoodsListState goodsListState = new _CategoryGoodsListState();
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return (_leftInkWel(goodsListState, index));
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

  Widget _leftInkWel(_CategoryGoodsListState goodsListState, int index) {
    bool isCheck = false;
    isCheck = (index == checkIndex) ? true : false;

    return InkWell(
      onTap: () {
        setState(() {
          checkIndex = index;
        });

        //var mallSubId = list[index].mallSubId;
        var categoryId = list[index].mallCategoryId;
        _getGoodList(categoryId: categoryId);


        var childList = list[index].bxMallSubDto;
        context.read<ChildCategory>().getChildCategory(childList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isCheck ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
            border:
            Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
  //得到商品列表数据
  void _getGoodList({String categoryId, String categorySubId}) async {
    var data = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': categorySubId == null ? '' : categorySubId,
      'page': 1
    };
    print(data.toString());
    await requestPost('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      Mallgoods mallgoods = Mallgoods.fromMap(data);
      Provider.of<CategoryGoodsListProvide>(context, listen: false).getGoodsList(
          mallgoods.data);
      // context.read<CategoryGoodsListProvide>().getGoodsList(mallgoods.data);
    });
  }
}

//右侧

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    //获取Provider对象
    var childcategory = Provider.of<ChildCategory>(context);
    return Container(
      child: Container(
          width: ScreenUtil().setWidth(550),
          height: ScreenUtil().setHeight(75),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
              Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childcategory.childCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(childcategory.childCategoryList[index]);
            },
          )),
    );
  }

  Widget _rightInkWell(BxMallSubDtoListBean item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}

//商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  @override
  void initState() {
   // _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //获取Provider对象
    var goodsList = Provider.of<CategoryGoodsListProvide>(context);
    return Container(
        width: ScreenUtil().setWidth(570),
        height: ScreenUtil().setHeight(1000),
        child: ListView.builder(
          itemCount: goodsList.goodsList.length,
          itemBuilder: (context, index) {
            CategoryListData categoryListData =   goodsList.goodsList[index];
            print('good = '+categoryListData.goodsName);
            return (_ListWidget(goodsList.goodsList[index]));
          },
        ));
  }

  Widget _goodsImage(CategoryListData categoryListData) {
    return Container(
      child: Image.network(categoryListData.image),
      width: ScreenUtil().setWidth(200),
    );
  }

  Widget _goodsName(CategoryListData categoryListData) {
    return Container(
      width: ScreenUtil().setWidth(370),
      padding: EdgeInsets.all(15),
      child: Text(
        categoryListData.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodsPrice(CategoryListData categoryListData) {
    return Container(
        width: ScreenUtil().setWidth(370),
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Text(
              '价格:￥${categoryListData.presentPrice}',
              style: TextStyle(
                  color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
            ),
            Text(
              '￥${categoryListData.oriPrice}',
              style: TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ));
  }

  Widget _ListWidget(CategoryListData categoryListData) {
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
            _goodsImage(categoryListData),
            Column(
              children: <Widget>[
                _goodsName(categoryListData),
                _goodsPrice(categoryListData),
              ],
            )
          ],
        ),
      ),
    );
  }


}
