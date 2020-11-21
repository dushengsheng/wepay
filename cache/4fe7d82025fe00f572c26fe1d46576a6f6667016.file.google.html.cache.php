<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 14:36:54
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/User/google.html" */ ?>
<?php /*%%SmartyHeaderCode:10821858875fb4c106a9b6d6-97785492%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4fe7d82025fe00f572c26fe1d46576a6f6667016' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/User/google.html',
      1 => 1599911298,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '10821858875fb4c106a9b6d6-97785492',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'user' => 0,
    'google_qrcode' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c106b2f275_00460127',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c106b2f275_00460127')) {function content_5fb4c106b2f275_00460127($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<style>
.inputbox{padding:0.6rem 0.5rem;}
</style>
<div class="setPassword3">
	<div class="HeadTop">
		<p class="Tit">设置谷歌验证</p>
		<a href="/?c=User&a=setting" class="backBtn"></a>
	</div>
	<div class="setPasswordCon">
		<div class="inputbox">账号：<span class="cpBtn" data-clipboard-text="<?php echo $_smarty_tpl->tpl_vars['user']->value['account'];?>
"><?php echo $_smarty_tpl->tpl_vars['user']->value['account'];?>
 <span style="color:#fc744d;">复制</span></span></div>
		<div class="inputbox">密钥：<span class="cpBtn" data-clipboard-text="<?php echo $_smarty_tpl->tpl_vars['user']->value['google_secret'];?>
"><?php echo $_smarty_tpl->tpl_vars['user']->value['google_secret'];?>
 <span style="color:#fc744d;">复制</span></span></div>
		<div class="inputbox">二维码：<br><div style="padding:0.5rem;min-height:220px;"><img src="<?php echo $_smarty_tpl->tpl_vars['google_qrcode']->value;?>
" style="width:80%;margin:0 auto;"/></div></div>
		<div class="inputbox">状态：
			<label><input type="radio" name="is_google" value="1" style="height:1.2rem;position:relative;top:3px;"/> 开启</label>&nbsp;&nbsp;
			<label><input type="radio" name="is_google" value="0" style="height:1.2rem;position:relative;top:3px;"/> 关闭</label>
		</div>
		<a href="javascript:;" class="confirmBtn">保存</a>
	</div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
 src="public/js/clipboard.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
preventDefault();
$(function(){

	var clipboard = new ClipboardJS('.cpBtn');
    clipboard.on('success', function (e) {
        _alert("复制成功");
    });

	var isGoogle='<?php echo $_smarty_tpl->tpl_vars['user']->value['is_google'];?>
';
	$('input[name="is_google"][value="'+isGoogle+'"]').prop('checked',true);

    $('.confirmBtn').on('click',function(){
        var obj=$(this);
        var is_google=$.trim($('input[name="is_google"]:checked').val());
        var has_click=obj.attr('has-click');
        if(has_click=='1'){
            return;
        }else{
            obj.attr('has-click','1');
        }
        ajax({
            url:global.appurl+'c=User&a=googleAct',
            data:{is_google:is_google},
            success:function(json){
                if(json.code!=1){
                    obj.attr('has-click','0');
                    _alert(json.msg);
                    return false;
                }
                _alert({
                    content:json.msg,
                    end:function(){
                       location.href='/?c=User&a=setting';
                    }
                });
            }
        });
    });

});


<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ("foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>
