<?php /*%%SmartyHeaderCode:5361004485fb17094754ab6-84474532%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '325f9cfc91f848c4a400074a9ae6319a00ab207d' => 
    array (
      0 => '/usr/local/lighthouse/softwares/btpanel/server/wepay/959/admin/view/Sys/userinfo.html',
      1 => 1578476498,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5361004485fb17094754ab6-84474532',
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5fb170947766f6_76782442',
  'cache_lifetime' => 300,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5fb170947766f6_76782442')) {function content_5fb170947766f6_76782442($_smarty_tpl) {?><div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header"><span>基本资料</span></div>
<div class="layui-card-body">
    
    <div id="appContentBox"></div>
    
    <script type="text/html" id="appContentTpl">
        <table class="layui-table">
            <colgroup>
                <col width="20%">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <td>头像</td>
                    <td><img style="height:50px;" src="{{d.user.headimgurl}}"/></td>
                </tr>
                <tr>
                    <td>账号</td>
                    <td>{{d.user.account}}</td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td>{{d.user.phone||''}}</td>
                </tr>
                <tr>
                    <td>邀请码</td>
                    <td>{{d.user.icode}}</td>
                </tr>
                <tr>
                    <td>姓名/昵称</td>
                    <td>{{d.user.realname}}/{{d.user.nickname}}</td>
                </tr>
                <tr>
                    <td>分组</td>
                    <td>{{d.user.gnmae}}</td>
                </tr>
                <tr>
                    <td>登录时间</td>
                    <td style="padding-bottom: 0;">{{d.user.login_time}}</td>
                </tr>
                <tr>
                    <td>登录IP</td>
                    <td style="padding-bottom: 0;">{{d.user.login_ip}}</td>
                </tr>
            </tbody>
        </table>
    </script>

</div>
</div>
</div>

<script>
ajax({
    url:global.appurl+'c=Login&a=userinfo',
    success:function(json){
        if(json.code!='1'){
            _alert(json.msg);
            return;
        }
        $('#appContentBox').html(layui.laytpl($('#appContentTpl').html()).render({user:json.data.user}));
    }
});
</script><?php }} ?>
