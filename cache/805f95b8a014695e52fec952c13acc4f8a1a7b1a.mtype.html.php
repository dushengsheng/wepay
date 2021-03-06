<?php /*%%SmartyHeaderCode:17948736635fb4c12e43b482-80851916%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '805f95b8a014695e52fec952c13acc4f8a1a7b1a' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/Pay/mtype.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17948736635fb4c12e43b482-80851916',
  'variables' => 
  array (
    'skey' => 0,
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c12e4747d1_69219991',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c12e4747d1_69219991')) {function content_5fb4c12e4747d1_69219991($_smarty_tpl) {?><div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header"><span>通道管理</span></div>
<div class="layui-card-body">

	<form class="layui-form" id="searchForm" onsubmit="return false;">
		<div class="layui-form-item" style="margin-bottom:5px;">
			<div class="layui-inline">
				<label class="layui-form-label" style="width:50px;">关键词</label>
				<div class="layui-input-inline" style="width:160px;">
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
	<script type="text/html" id="barItemAct">
		{{#if(d.edit==1){}}
		<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">编辑</a>
		{{#}}}
	</script>
	
</div>
</div>
</div>

<script type="text/html" id="layerTpl">
    <form class="layui-form LayerForm" onsubmit="return false;">
        <div class="layui-form-item layui-form-text bankBox">
            <label class="layui-form-label"><span>通道名称</span>：</label>
            <div class="layui-input-block">
                <input type="text" id="name" placeholder="" style="width:80%;" autocomplete="off" class="layui-input" value="{{d.item.name||''}}" />
            </div>
        </div>
        <div class="layui-form-item layui-form-text bankBox">
            <label class="layui-form-label"><span>最小金额</span>：</label>
            <div class="layui-input-block">
                <input type="text" id="min_money" placeholder="" style="width:80%;" autocomplete="off" class="layui-input" value="{{d.item.min_money||''}}" />
            </div>
        </div>
        <div class="layui-form-item layui-form-text bankBox">
            <label class="layui-form-label"><span>最大金额</span>：</label>
            <div class="layui-input-block">
                <input type="text" id="max_money" placeholder="" style="width:80%;" autocomplete="off" class="layui-input" value="{{d.item.max_money||''}}" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开启：</label>
            <div class="layui-input-block">
                                <input type="radio" name="is_open" value="1" title="是" checked="checked" />
				                <input type="radio" name="is_open" value="0" title="否"  />
				            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="hidden" id="item_id" value="{{d.item.id||''}}" />
                <span class="layui-btn" onclick="saveBtn(this)">提交保存</span>
            </div>
        </div>
    </form>
</script>

<script>
$('#searchBtn').on('click',function(){
	var obj=$(this);
	var pdata={
		s_keyword:$.trim($('#s_keyword').val())
	};
	dataPage({
		where:pdata,
        url:global.appurl+'c=Pay&a=mtype_list',
        cols:[[
            {field:'id', width:90, title: 'ptype'},
            {field:'name', title: '通道名称'},
            {field:'min_money', title: '订单最小金额'},
            {field:'max_money', title: '订单最大金额'},
            {field:'is_open_flag', title: '开启'},
            {field:'', width:180, title: '操作',toolbar:'#barItemAct'}
        ]],
        done:function(res, curr, count){
            //console.log(res);
        }
	});
});

$('#s_keyword').on('keyup',function(e){
	if(e.keyCode==13){
		$('#searchBtn').trigger('click');
	}
});

$('#searchBtn').trigger('click');

////////////////////////////////////////////////////

//当前操作项
var nowActItem=null;

//监听工具条
layui.table.on('tool(dataTable)', function(obj){
    nowActItem=obj;
    var item = obj.data;
    var layEvent = obj.event;
    var tr = obj.tr;
    
    if(layEvent === 'edit'){ //编辑
        updateView(obj);
    }
});

function updateView(obj){
    var item={};
    if(obj&&obj.data){
        item=obj.data;
        var title='编辑通道';
    }else{
        var title='添加通道';
    }
    layer.open({
        title:title,
        type: 1,
        shadeClose: true,
        area: global.screenType < 2 ? ['80%', '300px'] : ['400px', '355px'],
        content: layui.laytpl($('#layerTpl').html()).render({item:item}),
        success:function(){


            if(obj&&obj.data){
                $('input[name="is_open"][value="'+item.is_open+'"]').attr('checked',true);
            }else{
				
			}
            layui.form.render();
        }
    });
}

//保存更新
function saveBtn(ts){
    var obj=$(ts);
    var item_id=$('#item_id').val();
    var name=$.trim($('#name').val());
    var min_money=$.trim($('#min_money').val());
    var max_money=$.trim($('#max_money').val());
    var is_open=$('input[name="is_open"]:checked').val();
    var has_click=obj.attr('has-click');
    if(has_click=='1'){
        return false;
    }else{
        obj.attr('has-click','1');
    }
    ajax({
        url:global.appurl+'c=Pay&a=mtype_update',
        data:{
			item_id:item_id,name:name,is_open:is_open,
			min_money:min_money,max_money:max_money
		},
        success:function(json){
            _alert(json.msg);
            obj.attr('has-click','0');
            if(json.code!='1'){
                return false;
            }
            layer.closeAll('page');

            if(!item_id){
                $('#searchBtn').trigger('click');//重新加载
            }else{

                var uitem={
					name:name,
					min_money:min_money,
					max_money:max_money,
					is_open:is_open,
                    is_open_flag:$('input[name="is_open"][value="'+is_open+'"]').attr('title'),
                };
                nowActItem.update(uitem);
                
            }
        }
    });
}

</script><?php }} ?>
