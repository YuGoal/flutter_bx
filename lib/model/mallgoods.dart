/// code : "0"
/// message : "success"
/// data : [{"image":"https://images.baixingliangfan.cn/compressedPic/20200517100633_39.jpg","oriPrice":0.10,"presentPrice":0.10,"goodsName":"测试  测试勿买","goodsId":"6b590d0ceeb444998f0840bad4643904"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200309173111_9792.jpg","oriPrice":1.00,"presentPrice":0.90,"goodsName":"糖糕","goodsId":"38b856b64b644f4b86330cb61ea713b0"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200323104846_3241.jpg","oriPrice":1.00,"presentPrice":1.00,"goodsName":"金锣辣脆脆香肠32g","goodsId":"8c48aaa3970740899a0b22909966498f"},{"image":"https://images.baixingliangfan.cn/compressedPic/20190121101250_3231.jpg","oriPrice":1.21,"presentPrice":1.10,"goodsName":"汉德百士菠萝啤500ml","goodsId":"80a28efdb16b4fa29884095ef1399a7e"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200208170356_1498.jpg","oriPrice":1.50,"presentPrice":1.50,"goodsName":"卫群精纯加碘食用盐400g","goodsId":"3dd1afffb45e4de193a69e6419a339fd"},{"image":"https://images.baixingliangfan.cn/compressedPic/20190116161349_2735.jpg","oriPrice":1.60,"presentPrice":1.60,"goodsName":"今麦郎凉白开500ml","goodsId":"63ac261a8a964ad2b68c10df50f132db"},{"image":"https://images.baixingliangfan.cn/compressedPic/20190116160606_7101.jpg","oriPrice":1.60,"presentPrice":1.60,"goodsName":"农夫山泉天然水550ml","goodsId":"63d54204ce244418ac05aec800190cef"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200514134031_5987.jpg","oriPrice":2.50,"presentPrice":1.80,"goodsName":"永和豆浆低糖原味豆乳250ml","goodsId":"3e7e157dae2041b383e5ef87d043ca15"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200209171115_138.jpg","oriPrice":1.80,"presentPrice":1.80,"goodsName":"中天1粒脱皮卤蛋35g","goodsId":"a6d6ec64a1674079bc75d7137f7a2a68"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200309171752_3752.jpg","oriPrice":1.90,"presentPrice":1.90,"goodsName":"鹤壁特产缠丝蛋50克","goodsId":"196c7264f6774b9aae1041cef0258836"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200220102845_3106.jpg","oriPrice":1.90,"presentPrice":1.90,"goodsName":"双叶808橡皮(3块装）","goodsId":"8c148bd0f0404515a898919eaca64968"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200309172832_7177.jpg","oriPrice":1.90,"presentPrice":1.90,"goodsName":"老余叔海鸭蛋60克","goodsId":"f18d9358e9254712b1adaceb217ce4c1"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200207175710_4208.jpg","oriPrice":1.96,"presentPrice":1.96,"goodsName":"新蒜苔约2斤","goodsId":"a41a7a44d8f74a179dec3dc8ccdb089d"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200222134449_2839.jpg","oriPrice":2.00,"presentPrice":2.00,"goodsName":"卫群精纯未加碘食用盐400g","goodsId":"560484ddcafa47e39296eae2042d8719"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200210181859_8667.jpg","oriPrice":2.00,"presentPrice":2.00,"goodsName":"天凤夹心糖90g","goodsId":"94ed187b210a4cf0b1379c2cb0e851ad"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200317113730_4243.jpg","oriPrice":2.00,"presentPrice":2.00,"goodsName":"东北黏玉米1个","goodsId":"a7fb812d479a4f7582eaa06181d9e193"},{"image":"https://images.baixingliangfan.cn/compressedPic/20180713171213_7079.jpg","oriPrice":2.36,"presentPrice":2.36,"goodsName":"散韭菜约2斤装","goodsId":"35ed874aa18c4dec8eb0e5191a48adca"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200315111549_4410.jpg","oriPrice":2.36,"presentPrice":2.36,"goodsName":"散生菜约2斤","goodsId":"b70d8f91b463427e8a1329328a1d0a63"},{"image":"https://images.baixingliangfan.cn/compressedPic/20180713173731_344.jpg","oriPrice":2.37,"presentPrice":2.37,"goodsName":"散洋葱约3斤装","goodsId":"9c696658b2b843d7b7be796f3452c4ff"},{"image":"https://images.baixingliangfan.cn/compressedPic/20200220120416_330.jpg","oriPrice":2.40,"presentPrice":2.40,"goodsName":"鲜土豆粉（湿）（约4两）","goodsId":"3f26adb294df48c38ef4d7c25bd9d834"}]

class Mallgoods {
  String code;
  String message;
  List<CategoryListData> data;

  static Mallgoods fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Mallgoods mallgoodsBean = Mallgoods();
    mallgoodsBean.code = map['code'];
    mallgoodsBean.message = map['message'];
    mallgoodsBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => CategoryListData.fromMap(o))
    );
    return mallgoodsBean;
  }

  Map toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}

/// image : "https://images.baixingliangfan.cn/compressedPic/20200517100633_39.jpg"
/// oriPrice : 0.10
/// presentPrice : 0.10
/// goodsName : "测试  测试勿买"
/// goodsId : "6b590d0ceeb444998f0840bad4643904"

class CategoryListData {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  static CategoryListData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CategoryListData dataBean = CategoryListData();
    dataBean.image = map['image'];
    dataBean.oriPrice = map['oriPrice'];
    dataBean.presentPrice = map['presentPrice'];
    dataBean.goodsName = map['goodsName'];
    dataBean.goodsId = map['goodsId'];
    return dataBean;
  }

  Map toJson() => {
    "image": image,
    "oriPrice": oriPrice,
    "presentPrice": presentPrice,
    "goodsName": goodsName,
    "goodsId": goodsId,
  };
}