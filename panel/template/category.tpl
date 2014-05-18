<?php
if(isset($_GET['action'])){
	if($_GET['action']=='delete'){
		$query_del_category= 'DELETE FROM `category` WHERE `category`.`id` = '.$_GET['id'];
		if(mysql_query($query_del_category)){
			echo '<p class="alert alert-success">Категория успешно удалена</p>';
		}
	}
}

	$query_category_top= 'SELECT * FROM `category`';
	$res_category_top = mysql_query($query_category_top);
	while($category_top = mysql_fetch_array($res_category_top)){
		$categories_top[$category_top['id']]=$category_top['title'];
		$categories_top[0]="нет";
	}
?>
<a href="index.php?page=category_edit&action=add" class="btn" style="width:250px;">Добавить новую категорию</a>

	<table class="table table-striped table-bordered table-condensed span12">	
		<tr>			
			<td>Номер</td>
			<td>Наименование категории</td>
			<td>Вышестоящая категория</td>
			<td>Описание</td>		
			<td></td>		
		</tr>	
		<?php
		$query_category= 'SELECT * FROM `category`';
		$res_category = mysql_query($query_category);
		while($category = mysql_fetch_array($res_category)){
			echo '
		<tr>	
			<td>'.$category['id'].'</td>
			<td>'.$category['title'].'</td>
			<td>'.$categories_top[$category['nesting']].'</td>
			<td>'.mb_substr($category['description'], 0, 60, 'UTF-8').'</td>
			<td>
				<a href="index.php?page=category_edit&id='.$category['id'].'&action=edit">Редактировать</a>
				<a href="index.php?page=category&id='.$category['id'].'&action=delete">Удалить</a>
			</td>		
		</tr>';
		}
		?>
</table>