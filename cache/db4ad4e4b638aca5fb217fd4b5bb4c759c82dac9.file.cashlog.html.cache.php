<?php /* Smarty version Smarty-3.1.21-dev, created on 2020-11-16 02:13:51
         compiled from "/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/Finance/cashlog.html" */ ?>
<?php /*%%SmartyHeaderCode:17002667945fb16fdfa18400-29413482%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'db4ad4e4b638aca5fb217fd4b5bb4c759c82dac9' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/Finance/cashlog.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17002667945fb16fdfa18400-29413482',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'skey' => 0,
    'vo' => 0,
    'agent_arr' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb16fdfa620b8_54383769',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb16fdfa620b8_54383769')) {function content_5fb16fdfa620b8_54383769($_smarty_tpl) {?><style>
.imgItemBtn{cursor:pointer;}
.userItem{display:inline-block;margin-right:5px;border:1px solid #dedede;position:relative;width:80px;cursor:pointer;}
.userItem img{height:80px;}
.userItem .nickname{position:absolute;left:0;bottom:0;display:block;width:100%;overflow:hidden;background:rgba(11,11,11,0.4);color:#fefefe;text-align:center;}
.userItemNva{border:1px solid #f60;}
</style>
<div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header"><span>商户提现记录</span></div>
<div class="layui-card-body">



	<form class="layui-form" id="searchForm" onsubmit="return false;">
		<div class="layui-form-item" style="margin-bottom:5px;">
			<div class="layui-inline" style="margin-right:0;">
				<label class="layui-form-label" style="width:30px;">开始</label>
				<div class="layui-input-inline" style="width:120px;">
					<input name="s_start_time" id="s_start_time" class="layui-input" placeholder="开始日期" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label" style="width:30px;">结束</label>
				<div class="layui-input-inline" style="width:120px;">
					<input name="s_end_time" id="s_end_time" class="layui-input" placeholder="结束日期">
				</div>
			</div>
			
			<div class="layui-inline">
				<label class="layui-form-label" style="width:60px;">审核状态</label>
				<div class="layui-input-inline" style="width:120px;text-align:left;">
					<select id="s_status" name="s_status">
						<option value="0">全部</option>
						<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_smarty_tpl->tpl_vars['skey'] = new Smarty_Variable;
 $_from = getConfig('user_cash_status'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value) {
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['skey']->value = $_smarty_tpl->tpl_vars['vo']->key;
?>
						<option value="<?php echo $_smarty_tpl->tpl_vars['skey']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value;?>
</option>
						<?php } ?>
					</select>
				</div>
			</div>
			<!--
			<div class="layui-inline">
				<label class="layui-form-label" style="width:60px;">代付状态</label>
				<div class="layui-input-inline" style="width:120px;text-align:left;">
					<select id="s_pay_status" name="s_pay_status">
						<option value="all">全部</option>
						<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_smarty_tpl->tpl_vars['skey'] = new Smarty_Variable;
 $_from = getConfig('cnf_cashpay_status'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value) {
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['skey']->value = $_smarty_tpl->tpl_vars['vo']->key;
?>
						<option value="<?php echo $_smarty_tpl->tpl_vars['skey']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value;?>
</option>
						<?php } ?>
					</select>
				</div>
			</div>
			-->
			<div class="layui-inline">
				<label class="layui-form-label" style="width:50px;">关键词</label>
				<div class="layui-input-inline" style="width:180px;">
					<input type="text" name="s_keyword" id="s_keyword" autocomplete="off" class="layui-input" placeholder="请输入关键词">
				</div>
			</div>
			<div class="layui-inline" style="margin-right:0;">
				<input type="hidden" name="is_download" id="is_download"/>
				<span class="layui-btn" id="searchBtn">查询</span>
				<!--<span class="layui-btn layui-btn-danger" id="downloadBtn">导出</span>-->
			</div>
		</div>
	</form>
	
	<table class="layui-hide" id="dataTable" lay-filter="dataTable"></table>
	<!--记录操作工具条-->
	<?php echo '<script'; ?>
 type="text/html" id="barItemAct">
		{{#if(d.check==1&&d.status==1){}}
		<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="check">审核</a>
        {{#}}}
		
		{{#if(d.bkcf==1&&(d.real_money*1)>(d.dpay_money)&&d.status==1){}}
		<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="bkcf">拨款</a>
		{{#}}}
		
	<?php echo '</script'; ?>
>
	
</div>
</div>
</div>

<!--弹层-->
<?php echo '<script'; ?>
 type="text/html" id="layerTpl">
	<form class="layui-form LayerForm" onsubmit="return false;">
		<div class="layui-form-item" style="margin-bottom:5px;">
			<label class="layui-form-label" style="font-size:13px;">提现用户：</label>
			<div class="layui-input-block layui-form-label" style="width:70%;text-align:left;padding-left:0;margin-left:0;min-height:auto;">
				{{d.item.account}} / {{d.item.nickname}}
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom:5px;">
			<label class="layui-form-label" style="font-size:13px;">提现金额：</label>
			<div class="layui-input-block layui-form-label" style="width:70%;text-align:left;padding-left:0;margin-left:0;min-height:auto;">
				{{d.item.money}} <span style="padding-left:10px;">实际到账：{{d.item.real_money}}</span>
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom:5px;">
			<label class="layui-form-label" style="font-size:13px;">已拨款：</label>
			<div class="layui-input-block layui-form-label" style="width:70%;text-align:left;padding-left:0;margin-left:0;min-height:auto;">
				{{d.item.dpay_money}} <span style="padding-left:10px;">待拨款：<b style="color:#f30;">{{d.item.real_money-d.item.dpay_money}}</b> <span id="allhkBtn" data-money="{{d.item.real_money-d.item.dpay_money}}" style="color:#1E9FFF;cursor:pointer;">全部</span></span>
			</div>
		</div>
		<!--
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">指定代理：</label>
			<div class="layui-input-block">
				<input type="text" id="account" placeholder="请填写代理账号" autocomplete="off" class="layui-input" value="" />
				<span style="color:#f60;">代理可拨款余额：<span class="kbBalance">0</span></span>
			</div>
		</div>
		-->
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">指定代理：</label>
			<div class="layui-input-block">
				<select id="account_id">
					<option value="0">请选择代理</option>
					<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['agent_arr']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value) {
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
					<option value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['account'];?>
-<?php echo $_smarty_tpl->tpl_vars['vo']->value['nickname'];?>
（可拨款：<?php echo floatval($_smarty_tpl->tpl_vars['vo']->value['kb_balance']);?>
）</option>
					<?php } ?>
				</select>
			</div>
		</div>
	
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">拨款额度：</label>
			<div class="layui-input-block">
				<input type="text" id="money" placeholder="" autocomplete="off" class="layui-input" value="" />
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<input type="hidden" id="item_id" value="{{d.item.id||''}}" />
				<span class="layui-btn" onclick="saveBkBtn(this)">提交拨款</span>
			</div>
		</div>
	</form>
<?php echo '</script'; ?>
>

<?php echo '<script'; ?>
 type="text/html" id="layerTpl2">
	<form class="layui-form LayerForm" onsubmit="return false;">
		<table class="layui-table" style="width:100%;">
			<thead>
				<tr>
					<th>码商代理</th>
					<th>应拨款金额</th>
					<th>创建时间</th>
					<th>状态</th>
					<th>审核时间</th>
					<th>备注</th>
					<th>拨款凭证</th>
				</tr>
			</thead>
			<tbody id="bkdetailBox">
				
			</tbody>
		</table>
	</form>
<?php echo '</script'; ?>
>

<?php echo '<script'; ?>
>

$('#searchBtn').on('click',function(){
	var obj=$(this);
	var pdata={
		s_keyword:$.trim($('#s_keyword').val()),
		s_status:$.trim($('#s_status').val()),
		s_pay_status:$.trim($('#s_pay_status').val()),
		s_start_time:$.trim($('#s_start_time').val()),
		s_end_time:$.trim($('#s_end_time').val()),
	};
	dataPage({
		where:pdata,
        url:global.appurl+'c=Finance&a=cashlog_list',
        cols:[[
            {field:'id', width:70, title: 'ID'},
            //{field:'csn', title: '单号'},
            {field:'nickname',width:200,style:'text-align:left;',title: '单号/用户',templet:function(d){
                return d.csn+'<br>'+d.account+'<br>'+'【'+d.group_name+'】'+d.nickname;
            }},
            {field:'money', title: '提现金额'},
            {field:'fee', title: '手续费'},
            {field:'real_money', title: '实际到账'},
            {field:'dpay_money',width:140,title: '已拨款',templet:function(d){
				if(d.dpay_money<=0){
					return '0';
				}
				return '<a style="color:#1E9FFF;" href="javascript:;" lay-event="bkdetail" >'+d.dpay_money+' [明细]</a>';
			}},
            {field:'ori_balance', title: '提现前/后',style:'text-align:left;',templet:function(d){
				return '前：'+d.ori_balance+'<br>后：'+d.new_balance;
			}},
            //{field:'new_balance', title: '提现后'},
            {field:'create_time',width:130, title: '申请时间'},
            {field:'bank_name',width:240,style:'text-align:left;', title: '账户信息',templet:function(d){
                var html='';
                html+='<div>银行：'+d.bank_name+'</div>';
                html+='<div>姓名：'+d.bank_realname+'</div>';
                html+='<div>卡号：'+d.bank_account+'</div>';
                return html;
            }},
            {field:'check_time',width:120, title: '审核时间'},
            //{field:'pay_status_flag',title: '代付'},
            {field:'remark',title: '备注'},
            {field:'status_flag',width:100,title: '审核状态'},
            {field:'', width:120, title: '操作',toolbar:'#barItemAct'}
        ]],
        done:function(res, curr, count){
            //console.log(res);
            if($('.sumLine').length<1){
                var html='<div class="sumLine"><span>总数：'+res.odata.count+'</span><span>总额：'+res.odata.sum_money+'</span></div>';
                $('.layui-table-page').before(html);   
            }
        }
	});
});

$('#s_keyword').on('keyup',function(e){
	if(e.keyCode==13){
		$('#searchBtn').trigger('click');
	}
});

$('#searchBtn').trigger('click');

////////////////////////////////////////////////////////

//当前操作项
var nowActItem=null;

//监听工具条
layui.table.on('tool(dataTable)', function(obj){
    nowActItem=obj;
    var item = obj.data;
    var layEvent = obj.event;
    var tr = obj.tr;
 
    if(layEvent === 'check'){ //审核
        checkView(obj);
    }else if(layEvent=='bkcf'){
		layer.open({
			title:'提现拨款',
			type: 1,
			shadeClose: true,
			area: global.screenType < 2 ? ['80%', '300px'] : ['540px', '600px'],
			content: layui.laytpl($('#layerTpl').html()).render({item:item}),
			success:function(){
				
				layui.form.render();
			}
		});
	}else if(layEvent=='bkdetail'){
		layer.open({
			title:item.csn+'-拨款明细',
			type: 1,
			shadeClose: true,
			area: global.screenType < 2 ? ['80%', '300px'] : ['840px', '380px'],
			content: layui.laytpl($('#layerTpl2').html()).render({item:item}),
			success:function(){
				ajax({
					url:global.appurl+'c=Finance&a=cashlog_bkcf_list',
					data:{item_id:item.id},
					success:function(json){
						if(json.code!=1){
							_alert(json.msg);
							return;
						}
						var html='';
						for(var i in json.data.list){
							var it=json.data.list[i];
							html+='<tr>';
								html+='<td>'+it.account+' / '+it.nickname+'</td>';
								html+='<td>'+it.money+'</td>';
								html+='<td>'+it.create_time+'</td>';
								html+='<td>'+it.status_flag+'</td>';
								html+='<td>'+it.check_time+'</td>';
								html+='<td>'+(it.remark||'')+'</td>';
								var banners_str='';
								html+='<td>';
								for(var j in it.banners){
									banners_str+='<img src="'+it.banners[j]+'" style="height:40px;max-width:40px;" onclick="showImg(this)"/> ';
								}
								html+=banners_str+'</td>';
							html+='</tr>';
						}
						if(!html){
							html='<tr><td colspan="7">暂无数据</td></tr>';
						}
						$('#bkdetailBox').html(html);
					}
				});
				layui.form.render();
			}
		});
	}
	
});

$('body').on('click','#allhkBtn',function(){
	var obj=$(this);
	var money=obj.attr('data-money');
	$('#money').val(money);
});

//检测账号
$('body').on('blur','#account',function(){
	var obj=$(this);
	var account=obj.val();
	if(!account){
		return;
	}
	ajax({
		url:global.appurl+'c=Finance&a=cashlog_check_ubalance',
		data:{account:account},
		success:function(json){
			if(json.code!=1){
				return;
			}
			$('.kbBalance').text(json.data.kb_balance);
		}
	});
});

//提交拨款
function saveBkBtn(ts){
	var obj=$(ts);
	var item=nowActItem.data;
	var item_id=$('#item_id').val();
	var account=$('#account').val();
	var account_id=$('#account_id').val();
	var money=$('#money').val();
	if(!account_id||account_id<=1){
		alert('请选择代理');
		return;
	}
	var has_click=obj.attr('has-click');
	if(has_click=='1'){
		return false;
	}else{
		obj.attr('has-click','1');
	}
	ajax({
		url:global.appurl+'c=Finance&a=cashlog_bkcf',
		data:{item_id:item_id,account:account,account_id:account_id,money:money},
		success:function(json){
			_alert(json.msg);
			obj.attr('has-click','0');
			if(json.code!='1'){
				return false;
			}
			layer.closeAll('page');
			var uitem={
				dpay_money:item.dpay_money*1+money*1
			}
			nowActItem.update(uitem);
		}
	});
}


//审核
function checkView(obj){
    var item={};
    if(obj&&obj.data){
        item=obj.data;
    }
    var user_cash_status=JSON.parse('<?php echo json_encode(getConfig("user_cash_status"));?>
');
	var con='<form class="layui-form">状态：';
	for(var i in user_cash_status){
		var ck_str='';
		con+='<input type="radio" name="ck_status" value="'+i+'" title="'+user_cash_status[i]+'" '+ck_str+' />';
	}
	con+='<div style="padding-top:5px;">审核备注：<textarea placeholder="选填项" class="layui-textarea" id="ck_remark"></textarea></div>';
	con+='</form>';
	layer.open({
		title:'您确定要审核该提现申请么？',
		content:con,
		btnAlign: 'c',
		btn:['确定','取消'],
		success:function(){
			layui.form.render();
		},
		yes:function(index){
			var status=$('input[name="ck_status"]:checked').val();
			var status_flag=$('input[name="ck_status"]:checked').attr('title');
			if(status==undefined){
				alert('请选择审核状态');
				return false;
			}
			var remark=$.trim($('#ck_remark').val());
			ajax({
				url:global.appurl+'c=Finance&a=cashlog_check',
				data:{item_id:item.id,status:status,remark:remark},
				success:function(json){
					if(json.code=='1'){
						_alert(json.msg,'',function(){
                            layer.close(index);
                            var uitem={
                                check_time:json.data.check_time,
                                csn:json.data.csn,
                                remark:remark,
                                status:status,
                                status_flag:status_flag
                            };
                            if(json.data.pay_status){
                                uitem.pay_status=json.data.pay_status;
                                uitem.pay_status_flag=json.data.pay_status_flag;
                            }
                            nowActItem.update(uitem);
							$(nowActItem.tr.selector).find('td').last().find('a').after('/').remove();
						});
					}else{
						_alert(json.msg);
					}
				}
			});
			return false;
		},
		btn2:function(index){
			layer.close(index);
		}
	});
}

//导出操作
$('#downloadBtn').on('click',function(){
	$('#is_download').val(1);
	var params=$('#searchForm').serialize();
	var url='<?php echo @constant('APP_URL');?>
?c=User&a=cashlog_list&'+params;
	window.open(url,'_blank');
	$('#is_download').val(0);
});

<?php echo '</script'; ?>
><?php }} ?>
