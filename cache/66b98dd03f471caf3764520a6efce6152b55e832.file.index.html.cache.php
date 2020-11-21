<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 14:41:34
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Tg/index.html" */ ?>
<?php /*%%SmartyHeaderCode:19860010915fb4c21ec6cdf5-13006529%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '66b98dd03f471caf3764520a6efce6152b55e832' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Tg/index.html',
      1 => 1599911298,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19860010915fb4c21ec6cdf5-13006529',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'tg_img' => 0,
    'tg_url' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c21ece8ad5_55302693',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c21ece8ad5_55302693')) {function content_5fb4c21ece8ad5_55302693($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<div class="inviteFriend" style="height:100%;overflow;hidden;">
	<div class="HeadTop" style="background:rgba(1,154,255,0.2);">
		<p class="Tit">推荐二维码</p>
		<a href="/?c=User" class="backBtn"></a>
	</div>
    <img id="shareImg" src="<?php echo $_smarty_tpl->tpl_vars['tg_img']->value;?>
?v=1.1" style="height:100%;width:100%;" />
	
	<div data-clipboard-text="<?php echo $_smarty_tpl->tpl_vars['tg_url']->value;?>
" id="tgUrl" style="width:60%;line-height:38px;text-align:center;background-color:#fff;color:#019aff;position:fixed;bottom:12.5rem;left:20%;font-weight:bold;">复制推荐链接</div>
</div>
<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
 src="/public/js/clipboard.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
preventDefault();
$(function(){
	var clipboard = new ClipboardJS('#tgUrl');

	clipboard.on('success', function(e) {
		/*
		console.info('Action:', e.action);
		console.info('Text:', e.text);
		console.info('Trigger:', e.trigger);
		e.clearSelection();
		*/
		_alert('复制成功');
	});

});
<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ("foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>
