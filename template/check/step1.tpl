
	
	
		<h3>Информация для оплаты и доставки заказа</h3>
	<table class="cart" name="step1" id="step1">
	<?php cart_goods_title('Личные данные'); ?>
		<?php cart_goods('Ф.И.О.','name',$name); ?>
		<?php cart_goods('E-Mail','email',$email); ?>
		<?php cart_goods('Телефон','tel',$tel); ?>
	<?php cart_goods_title('Данные для доставки'); ?>
		<?php cart_goods('Индекс','index',$index); ?>
		<?php cart_goods('Город','city',$city); ?>
		<?php cart_goods('Адрес доставки','address',$address); ?>			
	</table>