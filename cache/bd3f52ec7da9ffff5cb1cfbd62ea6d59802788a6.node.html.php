<?php /*%%SmartyHeaderCode:19298085965fb16fb8b53183-65357033%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bd3f52ec7da9ffff5cb1cfbd62ea6d59802788a6' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/Sys/node.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19298085965fb16fb8b53183-65357033',
  'variables' => 
  array (
    'skey' => 0,
    'vo' => 0,
    'top_node_arr' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb16fb8b9afe1_30861670',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb16fb8b9afe1_30861670')) {function content_5fb16fb8b9afe1_30861670($_smarty_tpl) {?><div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header"><span>节点管理</span><span class="layui-btn layui-btn-sm layui-btn-normal addBtn">+添加节点</span></div>
<div class="layui-card-body">

    <form class="layui-form" id="searchForm" action="">
        <div class="layui-form-item" style="margin-bottom:5px;">
            
            <div class="layui-inline">
                <label class="layui-form-label" style="width:40px;">公共</label>
                <div class="layui-input-inline" style="width:80px;">
                    <select id="s_public">
                        <option value="all">全部</option>
                                                <option value="1">是</option>
                                                <option value="0">否</option>
                                            </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width:40px;">菜单</label>
                <div class="layui-input-inline" style="width:80px;">
                    <select id="s_type">
                        <option value="all">全部</option>
                                                <option value="1">是</option>
                                                <option value="0">否</option>
                                            </select>
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

    <table class="layui-hide" id="dataTable" lay-filter="dataTable"></table>
    <!--记录操作工具条-->
    <script type="text/html" id="barItemAct">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">编辑</a>
    </script>
    
</div>
</div>
</div>

<!--弹层-->
<script type="text/html" id="layerTpl">
	<form class="layui-form LayerForm" onsubmit="return false;">
		<div class="layui-form-item">
			<label class="layui-form-label">菜单：</label>
			<div class="layui-input-block">
				<input type="radio" name="type" value="0" title="否" checked="checked">
				<input type="radio" name="type" value="1" title="是">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">公共：</label>
			<div class="layui-input-block">
				<input type="radio" name="public" value="0" title="否" checked="checked">
				<input type="radio" name="public" value="1" title="是">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">父节点：</label>
			<div class="layui-input-block">
				<select id="pid">
                    <option value="0">请选择</option>
                                        <option value="1">系统管理</option>
                                        <option value="101">用户管理</option>
                                        <option value="201">文章资讯</option>
                                        <option value="209">支付管理</option>
                                        <option value="272">资金管理</option>
                    				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">NKEY：</label>
			<div class="layui-input-block">
				<input type="text" id="nkey" placeholder="" autocomplete="off" class="layui-input" value="{{d.item.nkey||''}}" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">名称：</label>
			<div class="layui-input-block">
				<input type="text" id="name" placeholder="" autocomplete="off" class="layui-input" value="{{d.item.name||''}}" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">图标：</label>
			<div class="layui-input-block">
				<input type="text" id="ico" placeholder="" autocomplete="off" class="layui-input" value="{{d.item.ico||''}}" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排序：</label>
			<div class="layui-input-block">
				<input type="text" id="sort" placeholder="" autocomplete="off" class="layui-input" value="{{d.item.sort||''}}" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">链接：</label>
			<div class="layui-input-block">
				<input type="text" id="url" placeholder="" autocomplete="off" class="layui-input" value="{{d.item.url||''}}" />
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注：</label>
			<div class="layui-input-block">
				<textarea id="remark" placeholder="" class="layui-textarea">{{d.item.remark||''}}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<input type="hidden" id="item_id" value="{{d.item.id||''}}" />
				<span class="layui-btn" onclick="saveAct(this);">提交保存</span>
			</div>
		</div>
	</form>
</script>


<script>

$('#searchBtn').on('click',function(){
	var obj=$(this);
	var pdata={
		s_keyword:$.trim($('#s_keyword').val()),
		s_type:$('#s_type').val(),
		s_public:$('#s_public').val()
	};
	dataPage({
		where:pdata,
        url:global.appurl+'c=Sys&a=node_list',
        page:{
            limit:20
        },
        cols:[[
            {field:'id', width:70, title: 'ID'},
            {field:'name',width:220,style:'text-align:left;', title: '节点名称',templet:function(d){
                var name=d.name;
                if(d.pid>0){
                    name='------'+name;
                }
                return name;
            }},
            {field:'nkey',width:220,style:'text-align:left;', title: 'NKEY'},
            {field:'type_flag', title: '菜单'},
            {field:'public_flag', title: '公共'},
            {field:'ico', title: '图标',templet:function(d){
                if(d.ico){
                    return '<i class="layui-icon">'+d.ico+'</i>';
                }
                return '';
            }},
            {field:'sort', title: '显示排序'},
            {field:'url', title: 'URL'},
            {field:'remark', title: '备注'},
            {field:'create_time', title: '创建时间'},
            {field:'', width:120, title: '操作',toolbar:'#barItemAct'}
        ]],
        done:function(res, curr, count){
            //console.log(res);
            layui.form.render();
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
 
    if(layEvent === 'del'){ //删除
        layer.confirm('确定要删除么？',{title:'系统提示',icon: 3},function(index){
            ajax({
                url:global.appurl+'c=Sys&a=node_delete',
                data:{item_id:item.id},
                success:function(json){
                    if(json.code!=1){
                        _alert(json.msg);
                        return;
                    }
                    obj.del();
                    layer.close(index);
                }
            });
        });
    } else if(layEvent === 'edit'){ //编辑
        updateView(obj);
    }
});

function updateView(obj){
    var item={};
    if(obj&&obj.data){
        item=obj.data;
        var title='编辑节点';
    }else{
        var title='添加节点';
    }
    layer.open({
        title:title,
        type: 1,
        shadeClose: true,
        area: global.screenType < 2 ? ['80%', '300px'] : ['540px', '600'],
        content: layui.laytpl($('#layerTpl').html()).render({item:item}),
        success:function(){

            if(obj&&obj.data){
                $('input[name="type"][value="'+item.type+'"]').attr('checked',true);
                $('input[name="public"][value="'+item.public+'"]').attr('checked',true);
                $('#pid').val(item.pid);
            }
            layui.form.render();
        }
    });
}
////////////////////////////////////////////////////////

$('.addBtn').on('click',function(){
    updateView(null);
});

////////////////////////////////////////////////////////


//保存更新
function saveAct(dom){
	var obj=$(dom);
	var item_id=$('#item_id').val();
	var i_index=$('#item_id').attr('i-index');
	var nkey=$.trim($('#nkey').val());
	var name=$.trim($('#name').val());
	var ico=$.trim($('#ico').val());
	var sort=$.trim($('#sort').val());
	var url=$.trim($('#url').val());
	var remark=$.trim($('#remark').val());
	var pid=$('#pid').val();
	var type=$('input[name="type"]:checked').val();
	var public=$('input[name="public"]:checked').val();
	if(!nkey){
		_alert('请填写NKEY');
		return false;
	}
	var has_click=obj.attr('has-click');
	if(has_click=='1'){
		return false;
	}else{
		obj.attr('has-click','1');
	}
	ajax({
		url:global.appurl+'c=Sys&a=node_update',
		data:{item_id:item_id,nkey:nkey,name:name,ico:ico,sort:sort,url:url,remark:remark,pid:pid,type:type,public:public},
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
                //同步更新
                nowActItem.update({
                    name: name,
                    nkey: nkey,
                    ico: ico,
                    sort: sort,
                    url: url,
                    remark: remark,
                    public: public,
                    public_flag:$('input[name="public"][value="'+public+'"]').attr('title'),
                    type: type,
                    type_flag: $('input[name="type"][value="'+type+'"]').attr('title'),
                    pid: pid,
                    pname: $('#pid').find('option[value="'+pid+'"]').text()
                });
			}
		}
	});
};


</script><?php }} ?>
