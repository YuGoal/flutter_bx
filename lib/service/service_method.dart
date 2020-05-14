import 'dart:math';

import "package:dio/dio.dart";
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

//获得火爆专区商品的方法
Future getHomePageBeloConten() async {
  try {
    print('开始获取下拉列表数据.................');
    Response response;
    Dio dio = new Dio();
    int page = 1;
    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//post 请求
Future requestPost(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (200 == response.statusCode) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
