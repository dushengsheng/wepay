<?php /*%%SmartyHeaderCode:4097392295fb5f411cc4a63-52870801%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f774a60aab96cd02efc1e260daadfe5fe00f4e4d' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/User/index.html',
      1 => 1599911298,
      2 => 'file',
    ),
    '630b0c9ecc1fb24ff0644c434eca3e89207c7ef6' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/head.html',
      1 => 1599911298,
      2 => 'file',
    ),
    '28f5de55a254a43fac3e2fe17bddc35d6c541b87' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/menu.html',
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
  'nocache_hash' => '4097392295fb5f411cc4a63-52870801',
  'variables' => 
  array (
    'user' => 0,
    'team_num' => 0,
    'order_num' => 0,
    'order_money' => 0,
    'yong_money' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb5f412032645_65197299',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb5f412032645_65197299')) {function content_5fb5f412032645_65197299($_smarty_tpl) {?><!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的 -abnma.com 搬码资源网</title>
<meta name="apple-touch-fullscreen" content="YES" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="email=no" name="format-detection" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="pragram" content="no-cache" />
<link rel="stylesheet" type="text/css" href="public/layer/need/layer.css">
<link rel="stylesheet" type="text/css" href="public/home/css/mainStyle.css?v=0.41">
<script type="text/javascript" src="public/home/js/init.js?v=0.41"></script>
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