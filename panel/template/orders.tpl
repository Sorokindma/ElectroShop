<?php
$query_orders_get = 'SELECT * FROM `orders` ORDER BY `id` DESC';
$res_orders_get = mysql_query($query_orders_get);

echo '<table>';
while($orders_get = mysql_fetch_array($res_orders_get)){
/*	$id = $orders_get['id'];
	$name = $orders_get['name'];
	$email = $orders_get['email'];
	$tel = $orders_get['tel'];
	$city = $orders_get['city'];
	$address = $orders_get['address'];
	$delivery = $orders_get['delivery'];
	$payment = $orders_get['payment'];
	$here = $orders_get['here'];
	$price_summ_total = $orders_get['price_summ_total'];
	$nds = $orders_get['nds'];
	$delivery_summ = $orders_get['delivery_summ'];
	$summ_total = $orders_get['summ_total'];
*/
	echo '<tr>';
	echo '<td>'. $orders_get['id'] .'</td>';
	echo '<td>'. $orders_get['name'] .'</td>';
	echo '<td>'. $orders_get['email'] .'</td>';
	echo '<td>'. $orders_get['tel'] .'</td>';
	echo '<td>'. $orders_get['city'] .'</td>';
	echo '<td>'. $orders_get['address'] .'</td>';
	echo '<td>'. $orders_get['delivery'] .'</td>';
	echo '<td>'. $orders_get['payment'] .'</td>';
	echo '<td>'. $orders_get['price_summ_total'] .'</td>';
	echo '<td>'. $orders_get['nds'] .'</td>';
	echo '<td>'. $orders_get['delivery_summ'] .'</td>';
	echo '<td>'. $orders_get['summ_total'] .'</td>';
	echo '</tr>';
}
echo '</table>';
		
?>