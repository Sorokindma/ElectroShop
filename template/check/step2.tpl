
	
	
	<table class="cart" name="step2" id="step2">     
		<?php cart_goods_title('Способ доставки'); ?>
		<tr>
			<td>
				<input type="radio" name="delivery" value="courier" onclick='delivery_cart("courier","500");' <?php if ($delivery=='courier'){echo 'checked';} ?>  />
				<label>Доставка курьером</label>
			</td>
		<tr>
		</tr>
			<td >
				<input type="radio" name="delivery" value="pickup" onclick='delivery_cart("pickup","0");' <?php if ($delivery=='pickup'){echo 'checked';}?> />
				<label>Самовывоз</label>
			</td>
		</tr>
	</table>
	
	<table class="cart" name="step2" id="payment" style="display:none;">     
		<?php cart_goods_title('Платежная система'); ?>
		<tr id="payment-pickup">
			<td >
				<input type="radio" name="payment" value="payment-pickup" <?php if ($payment=='payment-pickup'){echo 'checked';}?>/>
				<label>Наличные</br>Оплата наличными в магазине.</label>
			</td>
		</tr>
		<tr id="payment-courier">
			<td >
				<input type="radio" name="payment" value="payment-courier" <?php if ($payment=='payment-courier'){echo 'checked';}?>/>
				<label>Оплата курьеру</br>Оплата наличными курьеру.</label>
			</td>
		</tr>
		<tr id="payment-sber">
			<td >
				<input type="radio" name="payment" value="payment-sber" <?php if ($payment=='payment-sber'){echo 'checked';}?>/>
				<label>Оплата через сбербанк</br>Оплата с помощью квитанции Сбербанка.</label>
			</td>
		</tr>

	</table>


<script>
		payment("<?php echo $delivery; ?>")
</script>	