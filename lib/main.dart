import 'package:flutter/material.dart';
import 'package:fluttertaobao/pages/index_page.dart';
import 'package:fluttertaobao/provide/CategoryGoodsListProvide.dart';
import 'package:fluttertaobao/provide/child_category.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChildCategory()),
          ChangeNotifierProvider(create: (_) => CategoryGoodsListProvide())
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: IndexPage(),
      ),
    );
  }
}
