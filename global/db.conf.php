<?php
//####################DB配置开始###########################
$pwd='mysql_520DSS@wepay';
if(IS_WIN){
	$pwd='lESIHVND';
}

$_ENV['DB'][0]=[
    'HOST'=>'127.0.0.1',
    'USER'=>'wepay_959',
    'PASSWORD'=>$pwd,
    'NAME'=>'wepay_959',
    'PORT'=>3306
];

$_ENV['REDIS'][0]=[
	'host'       => '127.0.0.1',
	'port'       => 6379,
	'password'   => 'null',
	'select'     => 1,
	'timeout'    => 0,
	'expire'     => 0,
	'persistent' => false,
	'prefix'     => ''
];

$_ENV['TOKEN_EXPIRE_TIME']=7200;//用户token有效时间 秒

//####################DB配置结束############################

$_ENV['CONFIG']=[];
$_ENV['CONFIG']['SESSION']=[
	'NAME'=>'YPFENSSID',
	'TYPE'=>'memcache',
	'PREFIX'=>'ypfensess_',
	'EXPIRE'=>time()+86400*30
];
$_ENV['CONFIG']['MEMCACHE']=['PREFIX'=>'ypfen_'];

//socket相关配置
$_ENV['SOCKET']=[
	'PORT'=>19502,
	'HTTP_PORT'=>29582
];

$_ENV['SOCKET']['URL']="ws://{$_SERVER['HTTP_HOST']}:{$_ENV['SOCKET']['PORT']}";
$_ENV['SOCKET']['HTTP_URL']="http://127.0.0.1:{$_ENV['SOCKET']['HTTP_PORT']}";

//rpc相关配置
$_ENV['RPC']=[
	'URL'=>'http://localhost/rpc.php',
	'WHITE_IP'=>['127.0.0.1']
];

?>