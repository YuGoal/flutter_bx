import 'package:flutter/material.dart';
import 'package:fluttertaobao/model/category.dart';

class ChildCategory  with ChangeNotifier{
  List<BxMallSubDtoListBean> childCategoryList = [];

  getChildCategory(List<BxMallSubDtoListBean> list){
    BxMallSubDtoListBean all=  BxMallSubDtoListBean();
    all.mallSubId='00';
    all.mallCategoryId='00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList=[all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
}