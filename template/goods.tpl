<?php 
	$query_manufacture= 'SELECT * FROM `manufacture`';
	$res_manufacture = mysql_query($query_manufacture);
	while($manufacture = mysql_fetch_array($res_manufacture)){
		$manufactures[$manufacture['id']]=$manufacture['name'];
	}
?>
<?php
if(isset($_GET['id'])){
	$goods_id=$_GET['id'];
	$query_goods= 'SELECT * FROM `goods` WHERE `id`="'.$goods_id.'"';
	$res_goods = mysql_query($query_goods);
	while($goods = mysql_fetch_array($res_goods)){
	echo '<div class="goods-single">';
		$category = $goods['category'];
		$title = $goods['title'];
		$price = $goods['price'];
		$article = $goods['article'];
		$manufacture = $goods['manufacture'];
		$description = $goods['description'];
		$units = $goods['units'];
		$availability = $goods['availability'];
		
		echo '
		<img class="goods-single-logo" src="'.$site_url.'temp/goods/'.$goods['image'].'" />
		<div class="goods-single-block" >
		<h2>'.$title.'</h2>
		<p>'.$goods['description'].'</p>
	<table>	
		<tr>
			<td>
			<p>В наличии: ';
			if($availability==1){
				echo 'Да';
			}else{
				echo 'Нет';	
			}
			echo '</p>
			<p>Производитель: <a href='.$site_url.'manufacture/'.$manufacture.'>'.$manufactures[$manufacture].'</a></p>
			<p>'.$category.'</p>
			<p>Артикул: '.$article.'</p>
			</td>
			<td>
			<p>Цена: '.$price.'</p>
			<p>Количество <input id="price" type="text" value="0" /> '.$units.'</p>
<script>
	function buy'.$goods['id'].'(){
		if (typeof $.session.get("price_summ") =="undefined"){
			$.session.set("price_summ", "");
		}
		if (typeof $.session.get("amount_summ") =="undefined"){
			$.session.set("amount_summ", 0);
		}
		if (typeof $.session.get("summ") =="undefined"){
			$.session.set("summ", 0);
		}
			amount = $("#price'.$goods['id'].'").val()*1;
		if(amount>=1){
			amount_summ = $.session.get("amount_summ")*1;
			amount_summ=amount_summ+amount;
			$.session.set("amount_summ",amount_summ);
			price = "'.$goods['id'].'"+","+amount+"|";
			price_summ = price + $.session.get("price_summ");
			$.session.set("price_summ", price_summ);
			total ='.$goods["price"].'*amount;		
			total_summ = $.session.get("summ")*1;
			total_summ = total_summ + total;
			$.session.set("summ", total_summ);
			cart();
		}
	}
</script>
			<a href="#buy" onclick="buy'.$goods['id'].'();" ?>В корзину</a></td>
			</tr>
		</table>
			';
			echo '</div> <!-- Правый блок -->';
			include('module/similar_products/index.tpl');
			echo '</div> <!-- goods-single -->';
		}
}else{
	$query_goods= 'SELECT * FROM `goods`';
	$res_goods = mysql_query($query_goods);
	while($goods = mysql_fetch_array($res_goods)){
		echo '
			<div class="goods">	
			<img src="'.$site_url.'temp/goods/'.$goods['image'].'" />
			<h5>'.$goods['title'].'</h5>
			<p>Производитель: <b><a href='.$site_url.'manufacture/'.$goods['manufacture'].'>'.$manufactures[$goods['manufacture']].'</a></p></b>
			<p>Цена: '.$goods['price'].'</p>
			<p class="description">'.mb_substr($goods['description'], 0, 40, 'UTF-8').'... <a href="'.$site_url.'goods/'.$goods['id'].'">Подробнее</a></p>
			<p>Количество <input id="price'.$goods['id'].'" type="text" value="0" /> '.$goods['units'].'</p>
<script>
	function buy'.$goods['id'].'(){
		if (typeof $.session.get("price_summ") =="undefined"){
			$.session.set("price_summ", "");
		}
		if (typeof $.session.get("amount_summ") =="undefined"){
			$.session.set("amount_summ", 0);
		}
		if (typeof $.session.get("summ") =="undefined"){
			$.session.set("summ", 0);
		}
			amount = $("#price'.$goods['id'].'").val()*1;
		if(amount>=1){
			amount_summ = $.session.get("amount_summ")*1;
			amount_summ=amount_summ+amount;
			$.session.set("amount_summ",amount_summ);
			price = "'.$goods['id'].'"+","+amount+"|";
			price_summ = price + $.session.get("price_summ");
			$.session.set("price_summ", price_summ);
			total ='.$goods["price"].'*amount;		
			total_summ = $.session.get("summ")*1;
			total_summ = total_summ + total;
			$.session.set("summ", total_summ);
			cart();
		}
	}
			</script>
			<a class="addcart" href="#buy" onclick="buy'.$goods['id'].'();" ?><img src="'.$site_url.'image/addcart.png" alt="В корзину"/></a>
			</div>';
		}
}
?>