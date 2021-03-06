<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-18 14:33:08
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/User/datatj.html" */ ?>
<?php /*%%SmartyHeaderCode:2039577455fb4c024d87cc4-43332455%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'adade0990fe445fd200eef27a1570b82bc2926b5' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/User/datatj.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2039577455fb4c024d87cc4-43332455',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    's' => 0,
    'mtype_arr' => 0,
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c024db43b5_38872019',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c024db43b5_38872019')) {function content_5fb4c024db43b5_38872019($_smarty_tpl) {?><div class="layui-card">
  <div class="layui-card-header">数据统计</div>
  <div class="layui-card-body layui-text">
  
	<form class="layui-form" id="searchForm" action="">
		<div class="layui-form-item" style="margin-bottom:5px;">
			<div class="layui-inline" style="margin-right:0;">
				<label class="layui-form-label" style="width:30px;">开始</label>
				<div class="layui-input-inline" style="width:120px;">
					<input name="s_start_time" id="s_start_time" value="<?php echo $_smarty_tpl->tpl_vars['s']->value['s_start_time'];?>
" class="layui-input" placeholder="开始日期" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label" style="width:30px;">结束</label>
				<div class="layui-input-inline" style="width:120px;">
					<input name="s_end_time" id="s_end_time" value="<?php echo $_smarty_tpl->tpl_vars['s']->value['s_end_time'];?>
" class="layui-input" placeholder="结束日期">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label" style="width:60px;">支付类型</label>
				<div class="layui-input-inline" style="width:120px;">
					<select id="s_mtype_id" name="s_mtype_id">
						<option value="0">全部</option>
						<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_smarty_tpl->tpl_vars['skey'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['mtype_arr']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value) {
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['skey']->value = $_smarty_tpl->tpl_vars['vo']->key;
?>
						<option value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
</option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">搜索团队</label>
				<div class="layui-input-inline">
				<input type="text" name="s_keyword2" id="s_keyword2" placeholder="请输入关键词" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">关键词</label>
				<div class="layui-input-inline">
				<input type="text" name="s_keyword" id="s_keyword" placeholder="请输入关键词" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
				<span class="layui-btn" id="searchBtn">查询</span>
				<!--<span class="layui-btn layui-btn-danger">导出</span>-->
				</div>
			</div>
		</div>
	</form>
	

	<table class="layui-table">
		<tbody id="tjBox">

		</tbody>
	</table>
	<div style="height:300px;"></div>
	
  </div>
</div>

<?php echo '<script'; ?>
>
$('#searchBtn').on('click',function(){
	var obj=$(this);
	var pdata={
		s_keyword:$.trim($('#s_keyword').val()),
		s_keyword2:$.trim($('#s_keyword2').val()),
		s_mtype_id:$.trim($('#s_mtype_id').val()),
		s_start_time:$.trim($('#s_start_time').val()),
		s_end_time:$.trim($('#s_end_time').val())
	};
	ajax({
		url:global.appurl+'c=User&a=datatj_list',
		data:pdata,
		success:function(json){
			if(json.code!=1){
				_alert(json.msg);
				return;
			}
			var data=json.data;
			var html='';
			html+='<tr style="background:#f1f1f2;">';
			  html+='<th>订单总数</th>';
			  html+='<th>订单总额</th>';
			  html+='<th>总手续费</th>';
			  html+='<th>昨日统计</th>';
			  html+='<th>成功订单数</th>';
			  html+='<th>成功订单总额</th>';
			  html+='<th>成功手续费</th>';
			  html+='<th>订单成功率</th>';
			  html+='<th style="font-weight:bold;">利润</th>';
			html+='</tr>';
			html+='<tr>';
				html+='<td>'+json.data.od_sum_cnt+'</td>';
				html+='<td>'+json.data.od_sum_money+'</td>';
				html+='<td>'+json.data.od_sum_fee+'</td>';
				html+='<td>￥<b>'+data.od_ok_money_ytoday+'</b> / <b>'+data.od_all_money_ytoday+'</b>，<b>'+data.od_ok_cnt_ytoday+'</b> / <b>'+data.od_all_cnt_ytoday+'</b>单，成功率：<b>'+data.od_ytdpercent+'</b></td>';
				html+='<td>'+json.data.od_ok_cnt+'</td>';
				html+='<td>'+json.data.od_ok_money+'</td>';
				html+='<td>'+json.data.od_ok_fee+'</td>';
				html+='<td>'+json.data.od_ok_percent+'%</td>';
				html+='<td>'+json.data.profit+'</td>';
			html+='</tr>';
			
			html+='<tr><td colspan="9">&nbsp;</td></tr>';
			
			html+='<tr style="background:#f1f1f2;">';
			html+='<th>码商充值</th>';
			html+='<th>码商提现</th>';
			html+='<th>商户提现</th>';
			html+='<th>今日统计</th>';
			html+='<th>码商余额</th>';
			html+='<th>码商冻结</th>';
			html+='<th>商户余额</th>';
			html+='<th>商户冻结</th>';
			html+='<th>卡余额</th>';
			html+='</tr>';
			
			html+='<tr>';
				html+='<td>'+json.data.ms_pay_money+'</td>';
				html+='<td>'+json.data.ms_cash_money+'</td>';
				html+='<td>'+json.data.sh_cash_money+'</td>';
				html+='<td>￥<b>'+data.od_ok_money_today+'</b> / <b>'+data.od_all_money_today+'</b>，<b>'+data.od_ok_cnt_today+'</b> / <b>'+data.od_all_cnt_today+'</b>单，成功率：<b>'+data.od_tdpercent+'</b></td>';
				html+='<td>'+json.data.ms_balance+'</td>';
				html+='<td>'+json.data.ms_fz_balance+'</td>';
				html+='<td>'+json.data.sh_balance+'</td>';
				html+='<td>'+json.data.sh_fz_balance+'</td>';
				html+='<td>'+json.data.card_money+'</td>';
			html+='</tr>';
			
			html+='<tr><td colspan="9">&nbsp;</td></tr>';
			html+='<tr style="background:#f1f1f2;">';
			html+='<th colspan="3">15分钟统计</th>';
			html+='<th colspan="1">30分钟统计</th>';
			html+='<th colspan="5">60分钟统计</th>';
			html+='</tr>';
			
			html+='<tr>';
				html+='<td colspan="3">￥<b>'+data.m15_ok.money+'</b> / <b>'+data.m15_all.money+'</b>，<b>'+data.m15_ok.cnt+'</b> / <b>'+data.m15_all.cnt+'</b>单，成功率：<b>'+data.m15_percent+'</b></td>';
				html+='<td colspan="1">￥<b>'+data.m30_ok.money+'</b> / <b>'+data.m30_all.money+'</b>，<b>'+data.m30_ok.cnt+'</b> / <b>'+data.m30_all.cnt+'</b>单，成功率：<b>'+data.m30_percent+'</b></td>';
				html+='<td colspan="5">￥<b>'+data.m60_ok.money+'</b> / <b>'+data.m60_all.money+'</b>，<b>'+data.m60_ok.cnt+'</b> / <b>'+data.m60_all.cnt+'</b>单，成功率：<b>'+data.m60_percent+'</b></td>';
			html+='</tr>';
			
			$('#tjBox').html(html);
		}
	});
});

$('#searchBtn').trigger('click');

$('#s_keyword').on('keyup',function(e){
	if(e.keyCode==13){
		$('#searchBtn').trigger('click');
	}
});
<?php echo '</script'; ?>
><?php }} ?>
