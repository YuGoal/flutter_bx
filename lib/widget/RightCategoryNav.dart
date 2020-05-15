//右侧小类类别
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertaobao/model/category.dart';
import 'package:fluttertaobao/provide/child_category.dart';
import 'package:provider/provider.dart';

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    //获取Provider对象
    var childcategory = Provider.of<ChildCategory>(context);
    return Container(
      child: Container(
          width: ScreenUtil().setWidth(500),
          height: ScreenUtil().setWidth(80),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childcategory.childCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(childcategory.childCategoryList[index]);
            },
          )),
    );
  }

  Widget _rightInkWell(BxMallSubDtoListBean item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
