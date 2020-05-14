import 'package:flutter/material.dart';
import 'package:fluttertaobao/model/category.dart';

class ChildCategory  with ChangeNotifier{
  List<BxMallSubDtoListBean> childCategoryList = [];

  getChildCategory(List list){
    childCategoryList=list;
    notifyListeners();
  }
}