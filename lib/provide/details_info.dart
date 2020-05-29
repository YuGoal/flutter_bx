import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  Details details;

  //从后台获取数据
  getGoodsDetails(Details info) {
    details = info;
    notifyListeners();
  }
}
