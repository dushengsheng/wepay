<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 14:49:08
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/User/setting.html" */ ?>
<?php /*%%SmartyHeaderCode:8479548345fb4c3e49e01c7-10650852%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '22b9d93632300b19fdd4c83f767c59088e8daf1b' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/User/setting.html',
      1 => 1599911298,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8479548345fb4c3e49e01c7-10650852',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c3e4a5a288_82963660',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c3e4a5a288_82963660')) {function content_5fb4c3e4a5a288_82963660($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>


<div class="Set">
	<div class="HeadTop">
		<p class="Tit">设置</p>
		<a href="/?c=User" class="backBtn"></a>
	</div>
	<div class="SetCon">		
		<div class="linkRow">
			<a href="/?c=User&a=password"><p>修改登录密码</p></a>
		</div>
		<div class="linkRow">
			<a href="/?c=User&a=password2"><p>修改二级密码</p></a>
		</div>
		<div class="linkRow">
			<a href="/?c=User&a=google"><p>谷歌验证</p></a>
		</div>
		<a href="/?c=Login&a=logoutAct" class="exitLoginBtn">退出登录</a>
	</div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
>
preventDefault();
$(function(){

});
<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ("foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>
