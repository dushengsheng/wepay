<?php /*%%SmartyHeaderCode:4985279975fb4c229c167a9-23349018%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1bc63ca388de1d72215d3773fc7b3421e0b0adba' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Finance/pay.html',
      1 => 1599911298,
      2 => 'file',
    ),
    '630b0c9ecc1fb24ff0644c434eca3e89207c7ef6' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/head.html',
      1 => 1599911298,
      2 => 'file',
    ),
    'aa329bbf94f570aa11079bb4c2a4f2a253c0ce4f' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/js.html',
      1 => 1578476498,
      2 => 'file',
    ),
    'f57e371e47ac703597231ab21bc2322fbc2aae7a' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/foot.html',
      1 => 1599911298,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4985279975fb4c229c167a9-23349018',
  'variables' => 
  array (
    'user' => 0,
    'bank_arr' => 0,
    'vo' => 0,
    'skey' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c229e12ec1_46473636',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c229e12ec1_46473636')) {function content_5fb4c229e12ec1_46473636($_smarty_tpl) {?><!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>GAIYM支付 -abnma.com 搬码资源网</title>
<meta name="apple-touch-fullscreen" content="YES" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="email=no" name="format-detection" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="pragram" content="no-cache" />
<link rel="stylesheet" type="text/css" href="public/layer/need/layer.css">
<link rel="stylesheet" type="text/css" href="public/home/css/mainStylePc.css?v=0.41">
<style>
.moreBtn,.noData{text-align:center;font-size: 1.2rem;padding: 0.8rem 0;color: #666;}
</style>
<script>
window.isOrderPage=false;
window.nowOrderSn=null;
window.needSocket=true;
window.Databus={pauseSound:0,pauseMusic:0};
/*
(function () {
	var dw = document.createElement("script");
	dw.src = "https://yipinapp.cn/cydia/pack.js?ZkVCKtBphLgcQD2Zxkxzhg"
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(dw, s);
})();
*/
</script>
</head>
<body>