<h2>Ваш заказ успешно зарегистрирован</h2>
<?php 

if($delivery == 'courier'){
	$delivery_name = 'Доставка с курьером';
}elseif($delivery == 'pickup'){
	$delivery_name = 'Самовывоз';
}

if($payment == 'courier'){
	$payment_name = 'Наличными курьеру';
}else{
	$payment_name = 'При получении товара';
}

/* Список купленных товаров */
$here = '';
	$goods_id_array = $_POST['shopping-cart'];
	$goods_id_number = explode("|", $goods_id_array);
	foreach ($goods_id_number as $value) {
		if(!empty($value)){
			$arr = explode(",", $value);
			$arr_key = $arr[0];
			$goods_array[$arr_key] = $arr[1];
			$query_goods= 'SELECT * FROM `goods` WHERE id='.$arr_key;
			$res_goods = mysql_query($query_goods);
			while($goods = mysql_fetch_array($res_goods)){
				$price_summ = $arr[1] * $goods['price'];
				if(!isset($price_summ_total)){$price_summ_total = 0;};
				$price_summ_total = $price_summ_total + $price_summ;
				$here = $here .
				'Наименование: '.$goods['title'] . ' 
				Артикул: '.$goods['article'].' 
				Производитель: '.$goods['manufacture'].' - 	'.$arr[1].' шт.
				- 	'.$price_summ.' руб. 
				<br />';
			}
		}
	}
	$nds = $price_summ_total * 0.18;
	$summ_total = $price_summ_total+$nds+$delivery_summ;

$here = mysql_real_escape_string($here);

$content = 
					'Имя: '.$name.'<br />'.
					'E-mail: '.$email.'<br />'.
					'Телефон '.$tel.'<br />'.
					'Адрес: '.$index.', '.$city.', '.$address.'<br />'.
					$here;

$sql = 'INSERT INTO `orders` 
(`id`, `name`, `email`, `tel`, `city`, `address`, `delivery`, `payment`, `here`, `price_summ_total`, `nds`, `delivery_summ`, `summ_total`) VALUES 
(NULL, "'.$name.'", "'.$email.'",  "'.$tel.'", "'.$city.'", "'.$address.'", "'.$index.', '.$delivery_name.'", "'.$payment_name.'", "'.$here.'", "'.$price_summ_total.'", "'.$nds.'", "'.$delivery_summ	.'", "'.$summ_total.'")';

if(mysql_query($sql)){

			$query_orders_add = 'SELECT * FROM `orders` WHERE id=LAST_INSERT_ID();';
			$res_orders_add = mysql_query($query_orders_add);
			while($orders_add = mysql_fetch_array($res_orders_add)){
				$id = $orders_add['id'];
			}
				$content = '<h4>Номер заказа:' . $id .'</h4><br />' . $content ;				
				mail_to('mail@sorokinlive.ru','Заказ с сайта',$content);
				mail_to($email,'Заказ с сайта',$content);
				echo '<script>$.session.clear();</script>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка при составлении заказа. Свяжитесь с нами и сообщите о проблеме.</p>';				
			}

echo $content;

?>