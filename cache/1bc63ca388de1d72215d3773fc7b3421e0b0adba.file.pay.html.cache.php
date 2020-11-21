<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 14:41:45
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/home/view/Finance/pay.html" */ ?>
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
  ),
  'nocache_hash' => '4985279975fb4c229c167a9-23349018',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'user' => 0,
    'bank_arr' => 0,
    'vo' => 0,
    'skey' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c229ca6dd7_56168925',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c229ca6dd7_56168925')) {function content_5fb4c229ca6dd7_56168925($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>


<div class="fillCash">
	<!-- 顶部 -->
	<div class="HeadTop">
		<p class="Tit">充值</p>
		<a href="/?c=User" class="backBtn"></a>
		<a href="/?c=Finance&a=paylog" class="rightBtn">充值记录</a>
	</div>
	<div class="fillCashCon">
		<p class="userId">账号：<?php echo $_smarty_tpl->tpl_vars['user']->value['account'];?>
</p>
		<div class="fillCashNum">额度：
			<div class="inputbox"><input type="text" id="money" placeholder="请填写充值额度" ></div>
		</div>
		<h1>请选择收款账户</h1>
		<div class="paywayList">
			<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_smarty_tpl->tpl_vars['skey'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['bank_arr']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value) {
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['skey']->value = $_smarty_tpl->tpl_vars['vo']->key;
?>
			<a style="background-image:url(<?php echo $_smarty_tpl->tpl_vars['vo']->value['cover'];?>
);" href="javascript:;" class="alipay <?php if ($_smarty_tpl->tpl_vars['skey']->value==0) {?>on<?php }?>" data-id="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><p><?php echo $_smarty_tpl->tpl_vars['vo']->value['bank_name'];
if ($_smarty_tpl->tpl_vars['vo']->value['uid']) {?>【代理-<?php echo $_smarty_tpl->tpl_vars['vo']->value['nickname'];?>
】<?php }?></p></a>
			<?php } ?>
		</div>
		<a href="javascript:;" class="fillCashBtn" style="margin-top:2rem;">充值</a>
		<div style="padding:20px 20px;color:#999;">
			<div>1.单笔最小充值金额￥<?php echo getConfig('cnf_pay_min_money');?>
</div>
			<div>2.单笔最大充值金额￥<?php echo getConfig('cnf_pay_max_money');?>
</div>
		</div>
	</div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ("js.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php echo '<script'; ?>
>
preventDefault();
$(function(){
	
	$('.alipay').on('click',function(){
		var obj=$(this);
		$('.alipay').removeClass('on');
		obj.addClass('on');
	});
	
	$('.fillCashBtn').on('click',function(){
		var obj=$(this);
		var money=$.trim($('#money').val());
		var skbank_id=$('.paywayList .on').attr('data-id');
		if(!money){
			_alert('请填写充值额度');
			return;
		}
		if(!skbank_id){
			_alert('请选择收款账户');
			return;
		}
		var has_click=obj.attr('has-click');
		if(has_click=='1'){
			return;
		}else{
			obj.attr('has-click','1');
		}
		ajax({
			url:global.appurl+'c=Finance&a=payAct',
			data:{skbank_id:skbank_id,money:money},
			success:function(json){
				if(json.code!=1){
					obj.attr('has-click','0');
					_alert(json.msg);
					return;
				}
				_alert({
					content:json.msg,
					end:function(){
						var url=global.appurl+'c=Finance&a=payInfo&osn='+json.data.order_sn;
						location.href=url;
					}
				});
			}
		});
	});
	
});
<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ("foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>
