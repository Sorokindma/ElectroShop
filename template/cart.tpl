<?php 
	include('template/check/confirm.tpl');

if (!isset($confirm)){
	if(isset($_POST['shopping-cart'])||isset($_POST['shopping'])){
		if($_POST['shopping-cart']>=1||isset($_POST['shopping'])){

			
?>

<a href="#" onclick="unset()">Очистить корзину</a>
<form action="cart" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
	include('template/check/step1.tpl'); 
	include('template/check/step2.tpl'); 
	include('template/check/step3.tpl');
	?>
	
	<input type="hidden" name='delivery_summ' id="delivery_summ" value="<?php echo $delivery_summ; ?>" />
	<input type="hidden" name='shopping-cart-summ-total' id="shopping-cart-summ-total" value="<?php echo $price_summ_total+$nds; ?>" />
	<input type="hidden" name='shopping-cart' value="<?php echo $_POST['shopping-cart']; ?>" />
	<input type="submit" name='shopping' value="Оформить заказ" />
</form>
<?php 

	}else{
	echo '<h3 align="center">Ваша корзина пуста</h3>';
	}
	}else{
	echo '<h3 align="center">Ваша корзина пуста</h3>';
	}

} else{ /* Платеж совершен */	
	if($confirm==1){ /* Подмена данных */	
		include('template/check/success.tpl');
	}
}
	?>
	
	