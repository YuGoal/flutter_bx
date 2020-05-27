import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaobao/pages/index_page.dart';
import 'package:fluttertaobao/provide/CategoryGoodsListProvide.dart';
import 'package:fluttertaobao/provide/child_category.dart';
import 'package:fluttertaobao/provide/details_info.dart';
import 'package:provider/provider.dart';
import 'package:fluttertaobao/routers/application.dart';
import 'package:fluttertaobao/routers/routes.dart';



void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChildCategory()),
          ChangeNotifierProvider(create: (_) => CategoryGoodsListProvide()),
          ChangeNotifierProvider(create: (_) => DetailsInfoProvide())
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    //-----------------路由主要代码start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    //-----------------路由主要代码end

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
