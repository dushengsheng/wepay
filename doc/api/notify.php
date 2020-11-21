<?php
include './conf.php';

$params=$_REQUEST;

//######################rsa解密########################
//如果平台未开启RSA加密传输可忽略此段
$crypted=implode('+',explode(' ',$params['crypted']));
$resultArr=decryptRsa($crypted,$mch_rsa_private);
if($resultArr['code']!='1'){
	exit($resultArr['msg']);
}
$params=$resultArr['data'];
//如果平台未开启RSA加密传输可忽略此段
//######################rsa解密########################

$pdata=[
	'pt_order'=>$params['pt_order'],
	'sh_order'=>$params['sh_order'],
	'money'=>$params['money'],
	'status'=>$params['status'],
	'time'=>$params['time']
];
ksort($pdata);
$str='';
foreach($pdata as $pk=>$pv){
	$str.="{$pk}={$pv}&";
}
$str.="key={$mch_key}";
$sign=md5($str);

if($sign==$params['sign']){
	if($pdata['status']=='success'){
		//处理具体业务
		
		echo 'success';
	}else{
		echo 'fail';
	}
}else{
	echo 'sing error';
}

?>