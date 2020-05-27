import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertaobao/model/belowconten.dart';
import 'package:fluttertaobao/model/homepage.dart';
import 'package:fluttertaobao/service/service_method.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertaobao/routers/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  //火爆专区数据
  List<dynamic> hotGoodsList = [];

  @override
  Widget build(BuildContext context) {
    var formData = {'lon': '113.04054260253906', 'lat': '28.166854858398438'};
    int page = 1;

    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          //获取首页数据
          future: requestPost('homePageContext', formData: formData),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //解析数据
              var data = json.decode(snapshot.data.toString());
              HomepageModel homePage = HomepageModel.fromMap(data);
              List<SlidesBean> swiper = homePage.data.slides;
              List<CategoryBean> navigatorList = homePage.data.category; //类别列表
              if (navigatorList.length > 4) {
                navigatorList.removeRange(4, navigatorList.length);
              }
              String advertesPicture =
                  homePage.data.advertesPicture.PICTUREADDRESS; //广告图片
              String leaderImage = homePage.data.shopInfo.leaderImage; //店长图片
              String leaderPhone = homePage.data.shopInfo.leaderPhone; //店长电话
              List<RecommendBean> recommendList =
                  homePage.data.recommend; //商品推荐

              String floor1Title =
                  homePage.data.floor1Pic.PICTUREADDRESS; //楼层1的标题图片
              String floor2Title = homePage.data.floor2Pic.PICTUREADDRESS;

              String floor3Title = homePage.data.floor3Pic.PICTUREADDRESS;
              List<dynamic> floor1 = homePage.data.floor1; //楼层1商品和图片
              List<dynamic> floor2 = homePage.data.floor2; //楼层1商品和图片
              List<dynamic> floor3 = homePage.data.floor3; //楼层1商品和图片

              return EasyRefresh(
                header: MaterialHeader(),
                footer: MaterialFooter(),
                child: ListView(
                  children: <Widget>[
                    SwiperDiy(
                      swiperDataList: swiper,
                    ),
                    TopNavigator(navigatorList: navigatorList), //导航组件
                    AdBanner(advertesPicture: advertesPicture), //广告组件
                    LeaderPhone(
                      leaderImage: leaderImage,
                      leaderPhone: leaderPhone,
                    ),
                    Recommend(
                      recommendList: recommendList,
                    ),
                    FloorTitle(picture_address: floor1Title),
                    FloorContent(floorGoodsList: floor1),
                    FloorTitle(picture_address: floor2Title),
                    FloorContent(floorGoodsList: floor2),
                    FloorTitle(picture_address: floor3Title),
                    FloorContent(floorGoodsList: floor3),
                    _hotGoods(),
                  ],
                ),
                onRefresh: () async {
                  setState(() {
                    page = 1;
                    hotGoodsList.clear();
                  });
                  var formPage = {"page": page};
                  print('火爆数据 页数：${page}');
                  requestPost('homePageBelowConten', formData: formPage)
                      .then((val) {
                    var data = json.decode(val.toString());
                    Belowconten belowconten = Belowconten.fromMap(data);
                    List<dynamic> newGoodsList = belowconten.data;
                    print('火爆数据 数据：${data}');
                    if (newGoodsList.length > 0) {
                      setState(() {
                        hotGoodsList.addAll(newGoodsList);
                        page++;
                      });
                    }
                  });
                },
                onLoad: () async {
                  //todo 上拉加载数据一直是第一页 需要解决
                  var formPage = {"page": page};
                  print('火爆数据 页数：${page}');
                  requestPost('homePageBelowConten', formData: formPage)
                      .then((val) {
                    var data = json.decode(val.toString());
                    Belowconten belowconten = Belowconten.fromMap(data);
                    List<dynamic> newGoodsList = belowconten.data;
                    print('火爆数据 数据：${data}');
                    if (newGoodsList.length > 0) {
                      setState(() {
                        hotGoodsList.addAll(newGoodsList);
                        page++;
                      });
                    }
                  });
                },
              );
            } else {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  '加载中...',
                ),
              );
            }
          },
        ));
  }

  //火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Text('火爆专区'),
  );

  //火爆专区子项
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {
            print('object');
          },
          child: Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(360),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val.image,
                  width: ScreenUtil().setWidth(375),
                ),
                Text(
                  val.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val.mallPrice}'),
                    Text(
                      '￥${val.price}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  //火爆专区组合
  Widget _hotGoods() {
    return Container(
        child: Column(
          children: <Widget>[
            hotTitle,
            _wrapList(),
          ],
        ));
  }
}

//首页轮播插件
class SwiperDiy extends StatelessWidget {
  final List<SlidesBean> swiperDataList;

  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        onTap: (int index) {
          Application.router.navigateTo(
              context, "/detailsPage?id=${swiperDataList[index].goodsId}");
          },
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${swiperDataList[index].image}",
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//导航区域
class TopNavigator extends StatelessWidget {
  final List<CategoryBean> navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, CategoryBean item) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            item.image,
            width: ScreenUtil().setWidth(95),
          ),
          Text(item.mallCategoryName)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(175),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        padding: EdgeInsets.all(5),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//AdBanner 广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;

  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(advertesPicture),
    );
  }
}

//店长电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + leaderPhone;
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List<RecommendBean> recommendList;
  BuildContext buildContext;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Container(
      height: ScreenUtil().setHeight(400),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommedList()],
      ),
    );
  }

  //推荐商品标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
          Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text('商品推荐', style: TextStyle(color: Colors.pink)),
    );
  }

  //商品单独项
  Widget _item(index) {
    return InkWell(
        onTap: () {
          Application.router.navigateTo(
              buildContext, "/detailsPage?id=${recommendList[index].goodsId}");
        },
        child: Container(
          height: ScreenUtil().setHeight(330),
          width: ScreenUtil().setWidth(250),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
              Border(left: BorderSide(width: 0.5, color: Colors.black12))),
          child: Column(
            children: <Widget>[
              Image.network(recommendList[index].image),
              Text('￥${recommendList[index].mallPrice}'),
              Text(
                '￥${recommendList[index].price}',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            ],
          ),
        ));
  }

  //封装单独项为列表
  Widget _recommedList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(index);
          }),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final String picture_address; // 图片地址
  FloorTitle({Key key, this.picture_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品组件
class FloorContent extends StatelessWidget {
  final List<dynamic> floorGoodsList;
  BuildContext buildContext;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Container(
      child: Column(
        children: <Widget>[_firstRow(), _otherGoods()],
      ),
    );
  }

  Widget _goodsItem(dynamic goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          Application.router
              .navigateTo(buildContext, "/detailsPage?id=${goods.goodsId}");
        },
        child: Image.network(goods.image),
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }
}
