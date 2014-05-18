<?php 

/* Шаг 1 */

if(isset($_POST['name'])){
	$name = mysql_real_escape_string($_POST['name']);
}else{	$name = ''; }

if(isset($_POST['email'])){
	$email = mysql_real_escape_string($_POST['email']);
}else{	$email = ''; }

if(isset($_POST['tel'])){
	$tel = mysql_real_escape_string($_POST['tel']);
}else{	$tel = ''; }

if(isset($_POST['index'])){
	$index = mysql_real_escape_string($_POST['index']);
}else{	$index = ''; }

if(isset($_POST['city'])){
	$city = mysql_real_escape_string($_POST['city']);
}else{	$city = ''; }

if(isset($_POST['address'])){
	$address = mysql_real_escape_string($_POST['address']);
}else{	$address = ''; }

if (!empty($name)&&!empty($email)&&!empty($tel)&&!empty($city)&&!empty($address)){
		$step1 = 'good';
	} else{
			if(isset($_POST['shopping'])){
				echo 'Заполните все поля!';
			}

	

	
/* Шаг 2 */

if(isset($_POST['delivery'])){
	$delivery = mysql_real_escape_string($_POST['delivery']);
	$delivery_summ = mysql_real_escape_string($_POST['delivery_summ']);
}else{	
	$delivery = 'pickup'; 
	$delivery_summ = 0;
}

if(isset($_POST['payment'])){
	$payment = mysql_real_escape_string($_POST['payment']);
}else{	
	$payment = 'cash'; 
}

/* Шаг 3 */
	if(isset($step1)){
		if($step1 == 'good'){
			$confirm = 1;
		}
	}
}

?>
