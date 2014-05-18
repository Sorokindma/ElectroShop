<table class="cart order" name="step3" id="step3">
	<?php cart_goods_title('Состав заказа'); ?>
	<tr>
		<td>Название</td><td>Артикул</td><td>Производитель</td><td>Количество</td><td>Цена</td>
	</tr>
	<?php
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
				$delivery = 500;
				echo '
<tr>
	<td>
		'.$goods['title'].'
	</td>
	<td>
		'.$goods['article'].'
	</td>
	<td>
		'.$goods['manufacture'].'
	</td>
	<td>
		'.$arr[1].'
	</td>
	<td>
		'.$price_summ.'
	</td>
</tr>
				';
			}
		}
	}
	?>
	

	<tr>
		<td style="text-align: right;">Товаров на:</td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td><?php echo $price_summ_total; ?></td>
	</tr>
	<tr>
		<td style="text-align: right;">НДС (18%):</td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td><?php $nds = $price_summ_total * 0.18; echo $nds; ?></td>
	</tr>
	<tr>
		<td style="text-align: right;">Доставка:</td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td id="delivery_cart"><?php echo $delivery_summ; ?></td>
	</tr>
	<tr>
		<td style="text-align: right;">Итого:</td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td id="cart_summ"><?php echo $price_summ_total+$nds+$delivery_summ; ?></td>
	</tr>
	</table>