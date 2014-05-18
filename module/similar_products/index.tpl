 <link rel="stylesheet" href="<?php echo $site_url; ?>/module/similar_products/similar_products.css">


<?php
if(isset($_GET['id'])){
	$goods_id=$_GET['id'];
	echo '<table class="similar-products">
	<tr>
		<td>
			<h3>Похожие товары</h3>
		</td>
	</tr>
	<tr>';
	$query_goods= 'SELECT * FROM `goods` WHERE `category`="'.$category.'" AND id<>"'.$goods_id.'" ORDER BY `id` DESC LIMIT 5';
	$res_goods = mysql_query($query_goods);
	while($goods = mysql_fetch_array($res_goods)){
		echo '<td>
			<a href="#" class="similar-products-image"><img src="'.$site_url.'temp/goods/'.$goods['image'].'" /></a>
			<p class="similar-products-title"><b>'.mb_substr($goods['title'], 0, 50, 'UTF-8').'</b></p>
			<p>Производитель: <a href='.$site_url.'manufacture/'.$goods['manufacture'].'>'.$manufactures[$goods['manufacture']].'</a></p>
			<h3> '.$goods['price'].' руб.</h3>
			</td>';
		}
	echo '
	</tr>
	</table>';
}


?>