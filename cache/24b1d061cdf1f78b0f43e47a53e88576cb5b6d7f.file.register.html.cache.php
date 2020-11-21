<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-19 19:58:14
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Login/register.html" */ ?>
<?php /*%%SmartyHeaderCode:8186217905fb65dd6cb1232-48967082%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '24b1d061cdf1f78b0f43e47a53e88576cb5b6d7f' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Login/register.html',
      1 => 1605672751,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8186217905fb65dd6cb1232-48967082',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb65dd6cefe85_05443930',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb65dd6cefe85_05443930')) {function content_5fb65dd6cefe85_05443930($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<div class="Register">
	<div class="RegisterCon" style="padding-top:11rem;">
		<div class="inputbox phone"><input type="text" id="phone" placeholder="请填写手机账号"></div>
<!--
		<div class="inputbox Vecode">
			<input type="text" id="smscode" placeholder="请填写短信验证码">
			<a href="javascript:;" class="getVecodeBtn"><p>获取验证码</p></a>
		</div>
-->
		<div class="inputbox password"><input type="password" id="pwd" placeholder="请填写登录密码"></div>
		<div class="inputbox inviteCode"><input type="text" id="icode" value="<?php echo $_GET['icode'];?>
" placeholder="请填写邀请码"></div>
		<div class="inputbox inviteCode"><input type="text" id="realname" placeholder="请填写姓名"></div>
		<!--
		<div class="inputbox Vecode"><input type="text" id="idcard" placeholder="请填写身份证号"></div>
		-->
		<p class="bottxt">已有账号？<a href="/?c=Login">立即登录</a></p>
		<a href="javascript:;" class="registerBtn">注册</a>
	</div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
>

$('.getVecodeBtn p').on('click',function(){
	return true;
	var obj=$(this);
	var phone=$.trim($('#phone').val());
	if(!phone){
		_alert('请填写手机号');
		return false;
	}
	if(obj.attr('is-timer')){
		return true;
	}
	ajax({
		url:global.appurl+'a=getPhoneCode',
		data:{phone:phone,stype:1},
		success:function(json){
			if(json.code!=1){
				_alert(json.msg);
				return;
			}
			smsTimer(obj);
		}
	});
});

var appurlDownload='<?php echo getConfig("cnf_download_appurl");?>
';

$('.registerBtn').on('click',function(){
	var obj=$(this);
	var phone=$.trim($('#phone').val());
	if(!phone){
		_alert('请填写手机号');
		return false;
	}
	//var smscode=$.trim($('#smscode').val());
	var smscode='1';
	var icode=$.trim($('#icode').val());
	var nickname=$.trim($('#nickname').val());
	var pwd=$.trim($('#pwd').val());
	var realname=$.trim($('#realname').val());
	var idcard=$.trim($('#idcard').val());
	//var pwd_ck=$.trim($('#pwd_ck').val());
	var has_click=obj.attr('has-click');
	if(has_click=='1'){
		return false;
	}else{
		obj.attr('has-click','1');
	}
	pwd=md5(pwd);
	ajax({
		url:global.appurl+'c=Login&a=registerAct',
		data:{phone:phone,nickname:nickname,password:pwd,icode:icode,smscode:smscode,realname:realname,idcard:idcard},
		success:function(json){
			if(json.code!=1){
				obj.attr('has-click','0');
				_alert(json.msg);
				return;
			}
			_alert({
				content:json.msg,
				end:function(){
					//location.href='/?c=Login';
					location.href=appurlDownload;
				}
			});
		}
	});
});

<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ("foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>
<?php }} ?>
