import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertaobao/pages/details_page.dart';

Handler detailsHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsID = params['id'].first;
  return DetailsPage(goodsID);
});
