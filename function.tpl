<?php
function active_link($url,$page){ 
	if ($url==$page){
		echo 'class="active"';
	}
}

function page_content($page_url){ 
    $query_content = 'SELECT * FROM `page` WHERE name="'.$page_url.'"';
	$res_content = mysql_query($query_content);
	while($content = mysql_fetch_array($res_content)){
		return $content;
	}
}

function cart_goods($name,$system_name,$value=''){ 
	$text = '
	<tr>
		<td>
			<label>'.$name.'<span style="color:red;">*</span>:</label>
		</td>
		<td>
			<input type="text" name="'.$system_name.'" placeholder="'.$name.'" value="'.$value.'"/>
		</td>
	</tr>';
	echo $text;
}


function cart_goods_title($title){ 
	$text = '
	<tr>
		<td>
			<b><p>'.$title.'</p><b>
		</td>
	</tr>';
	echo $text;
}


function mail_to($to,$subject,$content){

/* сообщение */
$message = '
<html>
<head>
 <title>Заказ</title>
</head>
<body>
'.$content.'
</body>
</html>
';

/* Для отправки HTML-почты вы можете установить шапку Content-type. */
$headers= "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: Создан заказ \r\n"; 

/* и теперь отправим из */
mail($to, $subject, $message, $headers);

}
?>