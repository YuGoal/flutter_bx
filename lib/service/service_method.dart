import 'dart:developer';
import 'dart:io';

import "package:dio/dio.dart";
import 'dart:async';
import '../config/service_url.dart';

//post 请求
Future requestPost(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    print(formData);
    if (200 == response.statusCode) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
