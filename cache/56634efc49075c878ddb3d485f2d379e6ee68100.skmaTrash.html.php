<?php /*%%SmartyHeaderCode:12004031795fb4c134e17ff4-18177898%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '56634efc49075c878ddb3d485f2d379e6ee68100' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/Pay/skmaTrash.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12004031795fb4c134e17ff4-18177898',
  'variables' => 
  array (
    'mtype_arr' => 0,
    'vo' => 0,
    'skey' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb4c134ec2807_83184767',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb4c134ec2807_83184767')) {function content_5fb4c134ec2807_83184767($_smarty_tpl) {?><style>
.imgItemBtn{cursor:pointer;}
.banner_it{width:80px;height:80px;background-size:cover;border:1px solid #dedede;
line-height:80px;margin-right:5px;display:inline-block;float:left;text-align:center;font-size:4rem;cursor:pointer;
position:relative;}
.bannerItemCancel{position:absolute;right:0px;top:0px;font-size:30px;line-height:30px;background:rgba(11,11,11,0.5);color:#fff;}
</style>

<div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header"><span>收款码回收站</span></div>
<div class="layui-card-body">


    <form class="layui-form" id="searchForm" onsubmit="return false;">
        <div class="layui-form-item" style="margin-bottom:5px;">
            <div class="layui-inline">
                <label class="layui-form-label" style="width:40px;">类型</label>
                <div class="layui-input-inline" style="width:140px;">
                    <select id="s_mtype_id" name="s_mtype_id">
                        <option value="0">全部</option>
                                                <option value="1">支付宝扫码</option>
                                                <option value="2">微信扫码</option>
                                                <option value="3">银行卡转账</option>
                                                <option value="4">微信转手机</option>
                                                <option value="5">微信银行卡</option>
                                                <option value="6">云闪付</option>
                                                <option value="11">吱口令</option>
                                                <option value="12">支付宝转账码</option>
                                            </select>
                </div>
            </div>
			<!--
            <div class="layui-inline">
                <label class="layui-form-label" style="width:40px;">状态</label>
                <div class="layui-input-inline" style="width:100px;">
                    <select id="s_status" name="s_status">
                        <option value="0">全部</option>
                                                <option value="1">下线</option>
                                                <option value="2">在线</option>
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
    <script type="text/html" id="barItemAct">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="recovery">恢复</a>
    </script>
    
</div>
</div>
</div>


<script>

$('#searchBtn').on('click',function(){
    var obj=$(this);
    var pdata={
        s_keyword:$.trim($('#s_keyword').val()),
        s_status:99,
        s_mtype_id:$.trim($('#s_mtype_id').val()),
    };
    dataPage({
        where:pdata,
        url:global.appurl+'c=Pay&a=skma_list',
        cols:[[
            {field:'id', width:70, title: 'ID'},
            {field:'uid', title: '用户',templet:function(d){
				return d.account+'/'+d.nickname;
			}},
            {field:'mtype_name', title: '类型'},
            {field:'ma_realname', title: '收款姓名'},
            {field:'ma_account', title: '收款账号'},
            {field:'bank_id', title: '开户行',templet:function(d){
				if(d.bank_id==0){
					return '/';
				}
				return d.bank_name;
			}},
            {field:'ma_qrcode', title: '收款码',width:120,templet:function(d){
				if(d.bank_id>0||!d.ma_qrcode){
					return '/';
				}
				var qrcode='<img style="height:40px;" src="'+d.ma_qrcode+'"/ onclick="showImg(this);" >';
				return qrcode;
			}},
			{field:'province_name', title: '省份'},
			{field:'city_name', title: '城市'},
			{field:'min_money', title: '单笔最小'},
			{field:'max_money', title: '单笔最大'},
			{field:'create_time', title: '创建时间'},
            {field:'status_flag', title: '状态',width:100,templet:function(d){
				var style='';
				d.status_flag='已删除';
				var span='<span style="'+style+'">'+d.status_flag+'</span>';
				return span;
			}},
			{field:'tj', style:'text-align:left;',width:170,title: '订单统计',templet:function(d){
				var html='<div style="line-height:18px;">';
				html+='<div>今日：'+d.jt_money+'元 / '+d.jt_cnt+'笔</div>';
				html+='<div>昨日：'+d.zt_money+'元 / '+d.zt_cnt+'笔</div>';
				html+='<div>一周：'+d.wt_money+'元 / '+d.wt_cnt+'笔</div>';
				html+='</div>';
				return html;
			}},
            {field:'', width:90, title: '操作',toolbar:'#barItemAct'}
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

////////////////////////////////////////////////////////

//当前操作项
var nowActItem=null;

//监听工具条
layui.table.on('tool(dataTable)', function(obj){
    nowActItem=obj;
    var item = obj.data;
    var layEvent = obj.event;
    var tr = obj.tr;
    
    if(layEvent === 'recovery'){
        layer.confirm('确定要恢复么？',{title:'系统提示',icon: 3},function(index){
            ajax({
                url:global.appurl+'c=Pay&a=skma_recovery',
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
    }
});


////////////////////////////////////////////////////////

</script><?php }} ?>
