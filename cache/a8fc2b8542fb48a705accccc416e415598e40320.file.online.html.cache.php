<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 14:41:17
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Service/online.html" */ ?>
<?php /*%%SmartyHeaderCode:7802114165fb4c20d52c588-34231733%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a8fc2b8542fb48a705accccc416e415598e40320' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Service/online.html',
      1 => 1599911298,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7802114165fb4c20d52c588-34231733',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'info' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c20d5ad5c4_90503481',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c20d5ad5c4_90503481')) {function content_5fb4c20d5ad5c4_90503481($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
 id="__init-script-inline-widget__">
//(function(d,t,u,s,e){e=d.getElementsByTagName(t)[0];s=d.createElement(t);s.src=u;s.async=1;e.parentNode.insertBefore(s,e);})(document,'script','//103.80.27.20/php/app.php?widget-init-inline.js');
<?php echo '</script'; ?>
>
<style>
.kefuOnline{position: relative;width: 100%;color: #333333;background: #fff;}
.kefuOnlineCon{position: relative;width: 100%;padding-top:4rem;}
.kefuOnlineCon .txtbox{padding: 0 3%;font-size: 1.1rem;line-height: 1.8rem;}
.kefuOnlineCon .txtbox h3{color: #019aff;padding: 1.5rem 0 0.5rem;font-size: 1.3rem;}
.kefuOnlineCon .txtbox p{margin-bottom: 0.4rem;}
.kefuOnlineCon .qrcode{width: 45%;margin: 2rem auto;}
.kefuOnlineCon .welcomeTxt{text-align: center;}
.kefuOnlineCon .welcomeTxt p{background: #eef2f5;display: inline-block;padding: 0.3rem 0.8rem;border-radius: 0.2rem;}
</style>
<div style="height:4rem;"></div>
<div class="kefuOnline">
	<!--
	<div class="HeadTop">
		<p class="Tit">在线客服</p>
		<a href="/?c=Service" class="backBtn"></a>
	</div>
	-->
	<div class="kefuOnlineCon">
		<div class="txtbox">
			<h3>温馨提示：</h3>
			<?php echo $_smarty_tpl->tpl_vars['info']->value['content'];?>

		</div>

		<div class="qrcode" style="width:66%;margin-bottom:0;">
			<img src="<?php echo $_smarty_tpl->tpl_vars['info']->value['cover'];?>
">
		</div>
		<div style="color:#019aff;font-size:18px;text-align:center;padding:10px;padding-top:0;">截图保存图片，打开微信扫一扫添加客服</div>
		
		<div class="welcomeTxt">
			<p>欢迎您的咨询，期待为您服务！</p>
		</div>
	</div>
	
	<!-- 底部导航 -->
	<?php echo $_smarty_tpl->getSubTemplate ("menu.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

</div>

<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
>
$(function(){
	preventDefault();
});
<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ("foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>
