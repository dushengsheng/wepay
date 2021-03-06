<?php /*%%SmartyHeaderCode:1107608875fb4c0b3f11bc5-83143844%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e9be2beda4c02c78f0ae640d2a99d85a0c085452' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/User/agent.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1107608875fb4c0b3f11bc5-83143844',
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c0b3f37635_02227119',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c0b3f37635_02227119')) {function content_5fb4c0b3f37635_02227119($_smarty_tpl) {?><div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header"><span>码商代理列表</span></div>
<div class="layui-card-body">


    <form class="layui-form" id="searchForm" action="">
        <div class="layui-form-item" style="margin-bottom:5px;">
            <div class="layui-inline">
                <label class="layui-form-label" style="width:50px;">关键词</label>
                <div class="layui-input-inline" style="width:160px;">
                    <input type="text" name="s_keyword" id="s_keyword" autocomplete="off" class="layui-input" placeholder="请输入关键词">
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

    <table class="layui-hide" id="dataTable" lay-filter="dataTable"></table>
    <!--记录操作工具条-->
    <script type="text/html" id="barItemAct">
        {{#if(d.duopen==1){}}
			{{#if(d.du_open==1){}}
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="duopen">关闭接单</a>
			{{#}else{}}
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="duopen">开放接单</a>
			{{#}}}
		{{#}else{}}
		/
        {{#}}}
    </script>
	
</div>
</div>
</div>

<script>

$('#searchBtn').on('click',function(){
	var obj=$(this);
	var pdata={
		s_keyword:$.trim($('#s_keyword').val())
	};
	dataPage({
		where:pdata,
        url:global.appurl+'c=User&a=agent_list',
        cols:[[
            {field:'id', width:70, title: 'ID'},
			/*
            {field:'nickname',width:140, title: '用户',align:'left',style:'text-align:left;',templet:function(d){
                return '<img style="height:40px;" src="'+d.headimgurl+'"/> '+d.nickname;
            }},*/
            {field:'account',title: '码商代理',templet:function(d){
				return d.account+'<br>'+d.nickname;
			}},
            {field:'paccount',title: '邀请人',templet:function(d){
                if(d.paccount||d.prealname){
                    return d.prealname+'<br>'+d.paccount;
                }else{
                    return '';
                }
            }},
            {field:'balance',title: '可提余额'},
            {field:'sx_balance',title: '接单余额'},
            {field:'kb_balance', title: '应回款'},
			{field:'yong_money',width:120, title: '累计佣金',templet:function(d){
				return d.yong_money;
			}},
			{field:'duser_cnt', title: '下级人数'},
			{field:'xj_kb_balance',width:140, title: '下级应回款'},
            {field:'duser_order_money', title: '团队业绩'},
            {field:'du_open_flag',title: '下级接单状态'},
            {field:'act', width:140, title: '操作下级',toolbar:'#barItemAct'}
        ]],
        done:function(res, curr, count){
            //console.log(res);
            if($('.sumLine').length<1){
                var html='<div class="sumLine">';
					html+='<span>代理数：'+res.odata.count+'</span>';
					html+='<span>可提余额：'+res.odata.balance+'</span>';
					html+='<span>接单余额：'+res.odata.sx_balance+'</span>';
					html+='<span>应回款：'+res.odata.kb_balance+'</span>';
				html+='</div>';
				$('.layui-table-page').before(html);
            }
        }
	});
});

$('#searchBtn').trigger('click');

$('#s_keyword').on('keyup',function(e){
	if(e.keyCode==13){
		$('#searchBtn').trigger('click');
	}
});

////////////////////////////////////////////////////////


//当前操作项
var nowActItem=null;

//监听工具条
layui.table.on('tool(dataTable)', function(obj){
    nowActItem=obj;
    var item = obj.data;
    var layEvent = obj.event;
    var tr = obj.tr;
 
    if(layEvent=='duopen'){
		var du_open_flag='';
		if(item.du_open==1){
			du_open_flag='关闭接单';
		}else{
			du_open_flag='开放接单';
		}
        layer.confirm('确定要'+du_open_flag+'么？',{title:'系统提示',icon: 3},function(index){
            ajax({
                url:global.appurl+'c=User&a=duopen_update',
                data:{item_id:item.id},
                success:function(json){
                    if(json.code!=1){
                        _alert(json.msg);
                        return;
                    }
					_alert(json.msg);
					var uitem={
						du_open:json.data.du_open,
						du_open_flag:json.data.du_open_flag
					};
					nowActItem.update(uitem);
					if(uitem.du_open=='1'){
						html='<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="duopen">关闭接单</a>';
					}else{
						html='<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="duopen">开放接单</a>';
					}
					var tarObj=$(tr).find('td[data-field="act"]').find('a[lay-event="duopen"]');
					tarObj.after(html).remove();
                }
            });
        });
    }
});

</script><?php }} ?>
