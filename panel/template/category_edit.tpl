<?php 		
	if(isset($_GET['id'])){
		$id = $_GET['id'];	
	}
	if(isset($_POST['confirm'])){
		$description = $_POST['description'];
		$title = $_POST['title'];
		$categories_top = $_POST['category'];
		if($_GET['action']=='add'){
			$sql = 'INSERT INTO `category` (`id`,`title`, `nesting`, `description`) VALUES (NULL, "'.$title.'","'.$categories_top.'", "'.$description.'")';
			if(mysql_query($sql)){
				echo '<p class="alert alert-success">Категория успешно добавлена</p>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка при добавлении категории</p>';				
			}
			$query_category= 'SELECT * FROM `category` WHERE id=LAST_INSERT_ID()';
			$res_category = mysql_query($query_category);
			while($category = mysql_fetch_array($res_category)){
				$id = $category['id'];
			}
		}elseif($_GET['action']=='edit'){
			$sql = 'UPDATE `category` SET `description`="'.$description.'",`title`="'.$title.'",`nesting`="'.$categories_top.'" WHERE id="'.$id.'"';	
			if(mysql_query($sql)){
				echo '<p class="alert alert-success">Категория успешно изменена</p>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка при изменении категории</p>';				
			}
		}
	}
	if(isset($id)){

		$query_category= 'SELECT * FROM `category` WHERE id="'.$id.'"';
		$res_category = mysql_query($query_category);
		while($category = mysql_fetch_array($res_category)){
			$category_title = $category['title'];
			$categories_top = $category['nesting'];
			$category_description = $category['description'];
		}
			echo '
		<form action="index.php?page=category_edit&id='.$id.'&action=edit" method="post" enctype="multipart/form-data" accept-charset="UTF-8">';
	}else{
		$category_title = '';
		$categories_top = '';
		$category_description = '';	
		echo '
		<form action="index.php?page=category_edit&action=add" method="post" enctype="multipart/form-data" accept-charset="UTF-8">';
	}
	
	echo '
	<table>
			<tr>
				<td>Название:</td>
				<td><input class="all-width" type="name" name="title" value="'.$category_title.'"></td>
			</tr>
			<tr>
				<td>Вышестоящая категория:</td>
				<td>';
					category_select($categories_top);
	echo '				
				</td>
			</tr>
			<tr>
				<td>Описание:</td>
				<td>
				<textarea class="all-width" style="height:150px;" name="description" >'.$category_description.'</textarea></td>
			</tr>
			<tr>
				<td>
				<input type="submit" name="confirm" value="Сохранить" />	
				</td>
			</tr>
		</table>
	</form>
	';
?>