<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 23:01:12
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Login/forget.html" */ ?>
<?php /*%%SmartyHeaderCode:17412858965fb53738c17fa3-57409188%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'da559628bf01444d9cdc6f2747fdfb7cf22385ed' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Login/forget.html',
      1 => 1599911298,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17412858965fb53738c17fa3-57409188',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb53738c90d75_36987844',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb53738c90d75_36987844')) {function content_5fb53738c90d75_36987844($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<div class="setPassword">
	<div class="setPasswordCon">
		<div class="inputbox phone"><input type="text" id="phone" placeholder="请填写手机账号"></div>
		<div class="inputbox Vecode">
			<input type="text" id="smscode" placeholder="请输入短信验证码">
			<a href="javascript:;" class="getVecodeBtn"><p>获取验证码</p></a>
		</div>
		<div class="inputbox password"><input type="password" id="pwd" placeholder="请填写新登录密码"></div>
		<div class="inputbox password"><input type="password" id="pwd_ck" placeholder="请再次填写密码"></div>
		<a href="javascript:;" class="confirmBtn">立即找回</a>
	</div>
</div>
<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
>

$('.getVecodeBtn p').on('click',function(){
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
		data:{phone:phone,stype:3},
		success:function(json){
			if(json.code!=1){
				_alert(json.msg);
				return;
			}
			smsTimer(obj);
		}
	});
});

$('.confirmBtn').on('click',function(){
	var obj=$(this);
	var phone=$.trim($('#phone').val());
	var smscode=$.trim($('#smscode').val());
	var pwd=$.trim($('#pwd').val());
	var pwd_ck=$.trim($('#pwd_ck').val());
	if(pwd!=pwd_ck){
		_alert('密码两次输入不一致');
		return;
	}
	var has_click=obj.attr('has-click');
	if(has_click=='1'){
		return false;
	}else{
		obj.attr('has-click','1');
	}
	pwd=md5(pwd);
	ajax({
		url:global.appurl+'c=Login&a=forgetAct',
		data:{phone:phone,password:pwd,smscode:smscode},
		success:function(json){
			if(json.code!=1){
				obj.attr('has-click','0');
				_alert(json.msg);
				return;
			}
			_alert({
				content:json.msg,
				end:function(){
					location.href='/?c=Login';
				}
			});
		}
	});
});

<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ("foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>
