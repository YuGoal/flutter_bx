import 'package:flutter/material.dart';
import 'package:fluttertaobao/model/mallgoods.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];
  int childIndex = 0;

  //点击大类时更换商品列表
  getGoodsList(List<CategoryListData> list) {
    goodsList = list;
    notifyListeners();
  }

  changeChildIndex(index) {
    childIndex = index;
    notifyListeners();
  }
}
