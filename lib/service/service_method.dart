import 'dart:math';

import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

//获取首页数据
Future getHomePageContent() async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon': '113.04054260253906', 'lat': '28.166854858398438'};
    response = await dio.post(servicePath['homePageContext'], data: formData);
    if (200 == response.statusCode) {
      return response.data;
    } else {throw Exception('后端接口出现异常，请检测代码和服务器情况.........');}
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
