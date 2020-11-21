<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 14:37:04
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/User/password2.html" */ ?>
<?php /*%%SmartyHeaderCode:15550642205fb4c1103a52e0-65272913%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '65144970da0f12f665cf5d1505090ecf53d50f65' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/User/password2.html',
      1 => 1599911298,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15550642205fb4c1103a52e0-65272913',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'user' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c110421398_66590243',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c110421398_66590243')) {function content_5fb4c110421398_66590243($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<div class="setPassword3">
	<div class="HeadTop">
		<p class="Tit">修改二级密码</p>
		<a href="/?c=User&a=setting" class="backBtn"></a>
	</div>
	<div class="setPasswordCon">
		<div class="inputbox phone"><input type="text" id="phone" value="<?php echo $_smarty_tpl->tpl_vars['user']->value['phone'];?>
" disabled></div>
		<div class="inputbox Vecode">
			<input type="text" id="smscode" placeholder="短信验证码">
			<a href="javascript:;" class="getVecodeBtn"><p>获取验证码</p></a>
		</div>
		<div class="inputbox password"><input type="password" id="newpwd" placeholder="请填写新二级密码"></div>
		<div class="inputbox password"><input type="password" id="newpwd_ck" placeholder="确认新密码"></div>
		<a href="javascript:;" class="confirmBtn">确定</a>
		<div style="text-align:center;color:#f60;padding-top:1rem;">初始二级密码与登录密码相同</div>
	</div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
>
preventDefault();
$(function(){

    $('.getVecodeBtn p').on('click',function(){
        var obj=$(this);
		var phone='';
        if(obj.attr('is-timer')){
            return true;
        }
        ajax({
            url:global.appurl+'a=getPhoneCode',
            data:{phone:phone,stype:4},
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
        var smscode=$.trim($('#smscode').val());
        var newpwd=$.trim($('#newpwd').val());
        var newpwd_ck=$.trim($('#newpwd_ck').val());
        if(newpwd!=newpwd_ck){
            _alert('密码两次输入不一致');
            return;
        }
        var has_click=obj.attr('has-click');
        if(has_click=='1'){
            return;
        }else{
            obj.attr('has-click','1');
        }
        if(newpwd){
            newpwd=md5(newpwd);
        }
        ajax({
            url:global.appurl+'c=User&a=passwordAct',
            data:{type:2,smscode:smscode,newpwd:newpwd},
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
