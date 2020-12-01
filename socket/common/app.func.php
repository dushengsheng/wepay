<?php

function send($act, $data='',$obj){
	if(!$obj){
		return false;
	}
	$json=json_encode(['emit'=>'msgFromServer','act'=>$act,'data'=>$data]);
	$obj->emit('msgFromServer',$json);
}

function jsonReturn($code,$msg,$data=[]){
	$rdata=[
		'code'=>$code,
		'msg'=>$msg,
		'data'=>$data
	];
	$json=json_encode($rdata,256);
	return $json;
}

?>