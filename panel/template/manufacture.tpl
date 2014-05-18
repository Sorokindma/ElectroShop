<?php
if(isset($_GET['action'])){
	if($_GET['action']=='delete'){
		$query_del_manufacture= 'DELETE FROM `manufacture` WHERE `manufacture`.`id` = '.$_GET['id'];
		if(mysql_query($query_del_manufacture)){
			echo '<p class="alert alert-success">Производитель успешно удален</p>';
		}
	}
}
?>
<a href="index.php?page=manufacture_edit&action=add" class="btn" style="width:250px;">Добавить нового производителя</a>

	<table class="table table-striped table-bordered table-condensed span12">	
		<tr>			
			<td>Номер</td>
			<td>Изображение</td>
			<td>Наименование поставщика</td>
			<td>Описание</td>		
			<td></td>		
		</tr>	
		<?php
		$query_manufacture= 'SELECT * FROM `manufacture`';
		$res_manufacture = mysql_query($query_manufacture);
		while($manufacture = mysql_fetch_array($res_manufacture)){
			echo '
		<tr>	
			<td>'.$manufacture['id'].'</td>
			<td><img src="../temp/manufacture/'.$manufacture['image'].'" /></td>
			<td>'.$manufacture['name'].'</td>
			<td>'.mb_substr($manufacture['description'], 0, 60, 'UTF-8').'</td>
			<td>
				<a href="index.php?page=manufacture_edit&id='.$manufacture['id'].'&action=edit">Редактировать</a>
				<a href="index.php?page=manufacture&id='.$manufacture['id'].'&action=delete">Удалить</a>
			</td>		
		</tr>';
		}
		?>
</table>