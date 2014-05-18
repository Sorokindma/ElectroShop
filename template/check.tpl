<?php 
	if(isset($_POST['shopping-cart'])){
		if($_POST['shopping-cart']>=1){
			
?>
	<h3>Информация для оплаты и доставки заказа</h3>
	<table class="cart" name="step1" id="step1">
	<?php cart_goods_title('Личные данные'); ?>
		<?php cart_goods('Ф.И.О.','name'); ?>
		<?php cart_goods('E-Mail','email'); ?>
		<?php cart_goods('Телефон','tel'); ?>
	<?php cart_goods_title('Данные для доставки'); ?>
		<?php cart_goods('Индекс','index'); ?>
		<?php cart_goods('Адрес доставки','adress'); ?>			
	</table>
	
	<table class="cart" name="step2" id="step2">     
		<?php cart_goods_title('Способ доставки'); ?>
		<tr>
			<td>
				<input type="radio" name="delivery " checked />
				<label>Доставка курьером</label>
			</td>
		<tr>
		</tr>
			<td>
				<input type="radio" name="delivery " />
				<label>Самовывоз</label>
			</td>
		</tr>
	</table>
	
		
	<table class="cart" name="step2" id="step2">     
		<?php cart_goods_title('Платежная система'); ?>
		<tr>
			<td>
				<input type="radio" name="payment" checked />
				<label><b>Наличные курьеру</b></br>Оплата наличными при получении заказа курьеру.</label>
			</td>
		<tr>
		</tr>
			<td>
				<input type="radio" name="payment" />
				<label><b>Самовывоз</b></br>Оплата наличными при получении товара.</label>
			</td>
		</tr>
	</table>
	
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
		<td style="text-align: right;">НДС (18%, включен в цену):</td>
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
		<td>500.00</td>
	</tr>
	<tr>
		<td style="text-align: right;">Итого:</td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td class="no-border"></td>
		<td><?php echo $price_summ_total+$nds+$delivery; ?></td>
	</tr>
	</table>
	<input type="submit" value="Оформить заказ" />
</form>
<script>
	function buy(){
		amount = $("#price'.$goods['id'].'").val();
	}
	function shoping(){
		$("div").html(
		alert("good");
	}
</script>
<?php }else{
	echo '<h3 align="center">Ваша корзина пуста</h3>';
	}
	}else{
	echo '<h3 align="center">Ваша корзина пуста</h3>';
	}
	?>