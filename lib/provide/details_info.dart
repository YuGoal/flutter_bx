import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  Details details;

  //从后台获取数据
  getGoodsDetails(String id) {
    var formData = {'goodId': id};
    requestPost('getGoodDetailById',formData:formData).then((val){
      var responseData= json.decode(val.toString());
      print(responseData);
      details=Details.fromMap(responseData);

      notifyListeners();
    });

  }
}
