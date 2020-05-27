const serviceUrl= 'https://wxmini.baixingliangfan.cn';//此端口针对于正版用户开放，可自行fiddle获取。
const servicePath={
  'homePageContext': serviceUrl+'/baixing/wxmini/homePageContent', // 商家首页信息
  'homePageBelowConten': serviceUrl+'/baixing/wxmini/homePageBelowConten', //商城首页热卖商品拉取
  'getCategory': serviceUrl+'/baixing/wxmini/getCategory', //商品类别信息
  'getMallGoods': serviceUrl+'/baixing/wxmini/getMallGoods', //商品分类的商品列表
  'getGoodDetailById': serviceUrl+'/baixing/wxmini/getGoodDetailById', //商品详情页
};