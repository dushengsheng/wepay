<?php /*%%SmartyHeaderCode:6043941605fb16c6a2b76f6-03263602%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '45b1e134763f43c76970071caa69634f1cfc5730' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/Sys/safety.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6043941605fb16c6a2b76f6-03263602',
  'variables' => 
  array (
    'user' => 0,
    'skey' => 0,
    'vo' => 0,
    'google_qrcode' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb16c6a300976_55554746',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb16c6a300976_55554746')) {function content_5fb16c6a300976_55554746($_smarty_tpl) {?><style>
.googleBox{
	height:340px;width:240px;border:1px solid #dedede;position:absolute;left:500px;top:50px;
	padding:10px;
}
</style>
<div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header"><span>安全设置</span></div>
<div class="layui-card-body">

	<form class="layui-form">
		<div class="layui-form-item" style="margin-bottom:2px;">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-block" style="line-height:38px;">
				admin
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom:2px;">
			<label class="layui-form-label">绑定手机号</label>
			<div class="layui-input-block" style="line-height:38px;">
				19999999999			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新手机号</label>
			<div class="layui-input-block">
				<input type="text" id="phone" data-phone="19999999999" autocomplete="off"  class="layui-input layui-input-inline"> <span style="line-height:38px;">&nbsp;不做绑定可忽略</span>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">短信验证码</label>
				<div class="layui-input-inline" style="margin-right:0;">
					<input type="text" id="pcode" autocomplete="off" class="layui-input"  value="">
				</div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline" style="width:auto;margin-right:0;">
					<span class="layui-btn layui-btn-primary" onclick="getPhoneCode(this);" style="padding:0 8px;">获取验证码</span>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">登录密码</label>
			<div class="layui-input-block">
				<input type="password" id="password" autocomplete="off" placeholder="" style="width:190px;" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" id="password_c" autocomplete="off" placeholder="" style="width:190px;" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">二级密码</label>
			<div class="layui-input-block">
				<input type="password" id="password2" autocomplete="off" placeholder="" style="width:190px;" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" id="password2_c" autocomplete="off" placeholder="" style="width:190px;" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">谷歌验证</label>
			<div class="layui-input-block">
                                <input type="radio" name="is_google" value="1" title="开启"  />
				                <input type="radio" name="is_google" value="0" title="关闭" checked="checked" />
								<div>
1、Android移动设备：在手机应用市场搜索“Google身份验证器”或“Google Authenticator”，下载安装。<br>
2、iOS移动设备：进入AppStore，搜索“Google Authenticator”，下载安装。<br>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">&nbsp;</label>
			<div class="layui-input-block">
				<span class="layui-btn layui-btn-normal" onclick="saveBtn(this);">保存</span>
			</div>
		</div>
	</form>
	
		<div class="googleBox">
		<div style="text-align:center;padding-bottom:5px;">Google验证添加</div>
		<div style="width:240px;height:208px;background:url(https://api.qrserver.com/v1/create-qr-code/?data=otpauth%3A%2F%2Ftotp%2Fadmin%3Fsecret%3DYCZFQ2GORHTBIYA6&size=200x200&ecc=M) no-repeat center top;">
			
		</div>
		<div style="text-align:left;padding:0 10px;">
		账号：admin<br>
		密钥：YCZFQ2GORHTBIYA6
		</div>
		<div style="text-align:center;padding-top:2px;">
			<span class="layui-btn layui-btn-sm layui-btn-danger hideGoogle">隐藏谷歌配置</span>
			<div style="color:#f30;font-weight:bold;">隐藏后将不再显示，请谨慎操作</div>
		</div>
	</div>
	    <div style="clear:both;"></div>
</div>
</div>
</div>

<script>

function getPhoneCode(ts){
	var obj=$(ts);
	var phone=$.trim($('#phone').val());
	if(!phone){
		_alert('请填写新手机号');
		return false;
	}
	if(obj.attr('is-timer')){
		return true;
	}
	smsTimer(obj);
	ajax({
		url:global.appurl+'a=getPhoneCode',
		data:{phone:phone,stype:3},
		success:function(json){
            if(json.code!=1){
                _alert(json.msg);
                return;
            }
			console.log(json);
		}
	});
};

function saveBtn(ts){
	var obj=$(ts);
	var ori_phone=$('#phone').attr('data-phone');
	var phone=$.trim($('#phone').val());
	var pcode=$.trim($('#pcode').val());
	var password=$.trim($('#password').val());
	var password_c=$.trim($('#password_c').val());
	var password2=$.trim($('#password2').val());
	var password2_c=$.trim($('#password2_c').val());
	var is_google=$('input[name="is_google"]:checked').val();
	if(phone){
		if(phone==ori_phone){
			_alert('新手机号已经绑定');
			return false;
		}
		if(!pcode){
			_alert('请填写短信验证码');
			return false;
		}
	}
	if(password&&password!=password_c){
		_alert('登录密码两次输入不一致');
		return false;
	}else{
		if(password){
			password=md5(password);
		}
	}
	if(password2&&password2!=password2_c){
		_alert('二级密码两次输入不一致');
		return false;
	}else{
		if(password2){
			password2=md5(password2);
		}
	}
	var has_click=obj.attr('has-click');
	if(has_click=='1'){
		return false;
	}else{
		obj.attr('has-click','1');
	}
	ajax({
		url:global.appurl+'c=Sys&a=safety_update',
		data:{phone:phone,pcode:pcode,password:password,password2:password2,stype:3,is_google:is_google},
		success:function(json){
			if(json.code!='1'){
				obj.attr('has-click','0');
				_alert(json.msg);
				return false;
			}
			_alert(json.msg,'',function(){
				location.reload();
			});
		}
	});
}


//隐藏google配置
$('.hideGoogle').on('click',function(){
	layer.confirm('<span style="color:#f30;">隐藏谷歌配置信息后将不再显示，您确定要隐藏么？</span>',{title:'系统提示',icon: 3},function(index){
		ajax({
			url:global.appurl+'c=Sys&a=google_hide',
			data:{},
			success:function(json){
				if(json.code!=1){
					_alert(json.msg);
					return;
				}
				layer.close(index);
				_alert(json.msg,{},function(){
					location.reload();
				});
			}
		});
	});
});


</script><?php }} ?>
