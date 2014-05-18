<?php
if(isset($_GET['action'])){
	if($_GET['action']=='delete'){
		$query_del_goods= 'DELETE FROM `goods` WHERE `goods`.`id` = '.$_GET['id'];
		if(mysql_query($query_del_goods)){
			echo '<p class="alert alert-success">Товар успешно удален</p>';
		}
	}
}
?>

<?php 
	$query_manufacture= 'SELECT * FROM `manufacture`';
	$res_manufacture = mysql_query($query_manufacture);
	while($manufacture = mysql_fetch_array($res_manufacture)){
		$manufactures[$manufacture['id']]=$manufacture['name'];
	}
	
	$query_category= 'SELECT * FROM `category`';
	$res_category = mysql_query($query_category);
	while($category = mysql_fetch_array($res_category)){
		$categories[$category['id']]=$category['title'];
	}
?>
<a href="index.php?page=goods_edit&action=add" class="btn" style="width:250px;">Добавить новый товар</a>

	<table>	
		<tr>			
			<td>Номер</td>
			<td>Изображение</td>
			<td>Наименование товара</td>
			<td>Производитель</td>		
			<td>Категория</td>	
			<td>Описание</td>		
			<td></td>		
		</tr>	
		<?php
		$query_goods= 'SELECT * FROM `goods`';
		$res_goods = mysql_query($query_goods);
		while($goods = mysql_fetch_array($res_goods)){
			echo '
		<tr>	
			<td>'.$goods['id'].'</td>
			<td><img width="80" src="../temp/goods/'.$goods['image'].'" /></td>
			<td>'.$goods['title'].'</td>
			<td>'.$manufactures[$goods['manufacture']].'</td>
			<td>'.$categories[$goods['category']].'</td>
			<td>'.mb_substr($goods['description'], 0, 60, 'UTF-8').'</td>
			<td>
				<a href="index.php?page=goods_edit&id='.$goods['id'].'&action=edit">Редактировать</a>
				<a href="index.php?page=goods&id='.$goods['id'].'&action=delete">Удалить</a>
			</td>		
		</tr>';
		}
		?>
</table>