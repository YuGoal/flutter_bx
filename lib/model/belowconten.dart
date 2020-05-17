/// code : "0"
/// message : "success"
/// data : [{"name":"双汇后腿肉丝500g","image":"https://images.baixingliangfan.cn/compressedPic/20200317153903_3417.jpg","mallPrice":39.90,"goodsId":"d073be8643a24038b64a7ef40084eb61","price":44.90},{"name":"双汇猪蹄段1公斤","image":"https://images.baixingliangfan.cn/compressedPic/20200317154324_5403.jpg","mallPrice":69.00,"goodsId":"cc27b03e8c61469c8370c5183fd67975","price":75.00},{"name":"双汇冻五花肉片500g","image":"https://images.baixingliangfan.cn/compressedPic/20200317154048_261.jpg","mallPrice":39.90,"goodsId":"7f601c543325404e9099c71dd1eb029c","price":44.80},{"name":"双汇冻肋排段500g","image":"https://images.baixingliangfan.cn/compressedPic/20200317154219_8743.jpg","mallPrice":45.90,"goodsId":"2bbe73c8f7774f0a916e9877b002b18a","price":49.80},{"name":"双汇冻五花肉丁500g","image":"https://images.baixingliangfan.cn/compressedPic/20200317153803_5194.jpg","mallPrice":39.90,"goodsId":"f5cf95b9e3f842e5a6142a7139e21d4d","price":43.90},{"name":"国联东海白鲳鱼250g","image":"https://images.baixingliangfan.cn/compressedPic/20200303112731_7722.jpg","mallPrice":8.90,"goodsId":"242d49e85c484c5db05585354a9b3a1c","price":9.90},{"name":"即食红极参400g","image":"https://images.baixingliangfan.cn/compressedPic/20200303114008_221.jpg","mallPrice":49.80,"goodsId":"5b967c7984cb48f596b9bddb767efb5f","price":68.00},{"name":"深海平鱼约900g","image":"https://images.baixingliangfan.cn/compressedPic/20200315105458_6428.jpg","mallPrice":35.90,"goodsId":"52f7b9e8280e4cc291db1ecaba7bbc64","price":39.80},{"name":"糖糕","image":"https://images.baixingliangfan.cn/compressedPic/20200309173111_9792.jpg","mallPrice":0.90,"goodsId":"38b856b64b644f4b86330cb61ea713b0","price":1.00},{"name":"中粮香雪多用途麦芯粉5kg","image":"https://images.baixingliangfan.cn/compressedPic/20200217134804_2491.jpg","mallPrice":29.80,"goodsId":"94fb4adcb1bb47ad9dde501d8ec6bbc5","price":39.90},{"name":"鲁花5S压榨一级花生油5L","image":"https://images.baixingliangfan.cn/compressedPic/20180913111745_4189.jpg","mallPrice":139.90,"goodsId":"a2902da0239a4748b5b1602fd4afb37c","price":145.90},{"name":"永和豆浆低糖原味豆乳250ml","image":"https://images.baixingliangfan.cn/compressedPic/20200514134031_5987.jpg","mallPrice":1.80,"goodsId":"3e7e157dae2041b383e5ef87d043ca15","price":2.50},{"name":"红牛维生素饮料250ml","image":"https://images.baixingliangfan.cn/compressedPic/20180103171914_4025.jpg","mallPrice":4.90,"goodsId":"04027793756e474182d10e8fdd21d9f5","price":5.50},{"name":"莎布雷武士曲奇饼干70g","image":"https://images.baixingliangfan.cn/compressedPic/20200426083249_9487.jpg","mallPrice":7.80,"goodsId":"531ef21a341a4b06b252e4e950324aef","price":9.90},{"name":"丫眯的鲜花饼400g","image":"https://images.baixingliangfan.cn/compressedPic/20200426084238_5278.gif","mallPrice":17.80,"goodsId":"e48efee1c7f1415cb6ade272a05fb611","price":22.90},{"name":"美飘飘酵素果冻240g","image":"https://images.baixingliangfan.cn/compressedPic/20200424171024_5435.jpg","mallPrice":15.80,"goodsId":"29492bccce7f4649aae5dadefcb0a33e","price":20.00},{"name":"金冠散称果肉果冻系列约1斤","image":"https://images.baixingliangfan.cn/compressedPic/20200309162334_9215.jpg","mallPrice":9.80,"goodsId":"7f6eb89f36724812ab35700d84aabed6","price":11.80},{"name":"金冠散称果味果冻系列约1斤","image":"https://images.baixingliangfan.cn/compressedPic/20200309162428_4936.jpg","mallPrice":6.80,"goodsId":"13e65c3bf341457d89276560698eb410","price":7.80},{"name":"思念鲜肉混沌220g*3","image":"https://images.baixingliangfan.cn/compressedPic/20191205144258_4582.jpg","mallPrice":10.00,"goodsId":"5c0d7b1a548b4b0d8d5f42f05dc94475","price":17.70},{"name":"李子柒海鸭蛋黄酱80g","image":"https://images.baixingliangfan.cn/compressedPic/20200424172341_3726.gif","mallPrice":16.80,"goodsId":"e13f812f9aaf4e3da07c22591dc80cb1","price":25.00}]

class Belowconten {
  String code;
  String message;
  List<DataBean> data;

  static Belowconten fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Belowconten belowcontenBean = Belowconten();
    belowcontenBean.code = map['code'];
    belowcontenBean.message = map['message'];
    belowcontenBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => DataBean.fromMap(o))
    );
    return belowcontenBean;
  }

  Map toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}

/// name : "双汇后腿肉丝500g"
/// image : "https://images.baixingliangfan.cn/compressedPic/20200317153903_3417.jpg"
/// mallPrice : 39.90
/// goodsId : "d073be8643a24038b64a7ef40084eb61"
/// price : 44.90

class DataBean {
  String name;
  String image;
  double mallPrice;
  String goodsId;
  double price;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.name = map['name'];
    dataBean.image = map['image'];
    dataBean.mallPrice = map['mallPrice'];
    dataBean.goodsId = map['goodsId'];
    dataBean.price = map['price'];
    return dataBean;
  }

  Map toJson() => {
    "name": name,
    "image": image,
    "mallPrice": mallPrice,
    "goodsId": goodsId,
    "price": price,
  };
}