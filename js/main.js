/* Сессия */
function unset(){			
	$.session.clear();
	location="/goods";
}

/* Корзина */
function cart(){
	if (typeof $.session.get("amount_summ") !="undefined"){
		cart_local_summ = Math.round($.session.get("summ")*100)/100;
		cart_text = "Товаров "+$.session.get("amount_summ")+" на сумму "+cart_local_summ;
		cart_shopping_text = $.session.get("price_summ");
		$("#cart").val(cart_text);
		$("#shopping-cart").val(cart_shopping_text);
		$('body,html').animate({scrollTop: 0}, 400);
		tooltip();
	}else{
		cart_text = "Корзина пуста";
		$("#cart").val(cart_text);
	}
}

$(document).ready(cart);

	
/* Доставка и оплата */

function payment(confirm){
	if(confirm=="pickup"){
		$("#payment-pickup").show();
		$("#payment-courier").hide();
		$("#payment").show();		
	}else if (confirm=="courier"){
		$("#payment-pickup").hide();
		$("#payment-courier").show();
		$("#payment").show();	
	}
}
	
	
function delivery_cart(confirm,val){
	val = val*1;
	$("#delivery_cart").html(val);
	$("#delivery_summ").val(val);
	cart_local_summ = $("#shopping-cart-summ-total").val();
	cart_local_summ = cart_local_summ*1;
	new_cart_summ = cart_local_summ + val;
	new_cart_summ = Math.round(new_cart_summ*100)/100;
	$("#cart_summ").html(new_cart_summ);
	payment(confirm);
}
