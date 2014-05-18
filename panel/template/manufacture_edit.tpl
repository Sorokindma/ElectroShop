<?php 		

	if(isset($_GET['id'])){
		$id = $_GET['id'];	
	}
	if(isset($_POST['confirm'])){
		$description = $_POST['description'];
		$name = $_POST['name'];
		$old_image = $_POST['old_image'];
	if(!empty($_FILES['image']['name'])){
		$uploaddir = '../temp/manufacture/'; // Relative path under webroot
		$file_name = $_FILES['image']['name'];
		$file_type = substr($file_name, strrpos($file_name, '.')+1);
		$file_name = rand(1000000,9999999).'.'.$file_type;
		$uploadfile = $uploaddir . $file_name;
		if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
			$image = $file_name ;
		} else {
			echo "Изображение не было загружено.\n";
		}
	}
		
		if($_GET['action']=='add'){
			if(!isset($image)){
				$image = 'null_image.png';
			}
			$sql = 'INSERT INTO `manufacture` (`id`,`name`, `description`, `image`) VALUES (NULL, "'.$name.'", "'.$description.'", "'.$image.'")';
			if(mysql_query($sql)){
				echo '<p class="alert alert-success">Информация производителя успешно добавлена</p>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка добавлении информации производителя </p>';				
			}
			$query_manufacture= 'SELECT * FROM `manufacture` WHERE id=LAST_INSERT_ID()';
			$res_manufacture = mysql_query($query_manufacture);
			while($manufacture = mysql_fetch_array($res_manufacture)){
				$id = $manufacture['id'];
			}
		}elseif($_GET['action']=='edit'){
			if(!isset($image)){
				if (!isset($old_image)){
					$image = 'null_image.png';
				}else{
					$image = $old_image;
				}
			}
			$sql = 'UPDATE `manufacture` SET `description`="'.$description.'",`name`="'.$name.'",`image`="'.$image.'" WHERE id="'.$id.'"';	
			if(mysql_query($sql)){
				echo '<p class="alert alert-success">Информация производителя успешно изменена</p>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка при изменении информации производителя </p>';				
			}
		}
	}
	if(isset($id)){

		$query_manufacture= 'SELECT * FROM `manufacture` WHERE id="'.$id.'"';
		$res_manufacture = mysql_query($query_manufacture);
		while($manufacture = mysql_fetch_array($res_manufacture)){
			$manufacture_name = $manufacture['name'];
			$manufacture_description = $manufacture['description'];
			$manufacture_image = $manufacture['image'];
		}
			echo '
		<form action="index.php?page=manufacture_edit&id='.$id.'&action=edit" method="post" enctype="multipart/form-data" accept-charset="UTF-8">';
	}else{
		$manufacture_name = '';
		$manufacture_description = '';	
		$manufacture_image = 'null_image.png';
		echo '
		<form action="index.php?page=manufacture_edit&action=add" method="post" enctype="multipart/form-data" accept-charset="UTF-8">';
	}
	
	echo '
	<table>
			<tr>
				<td>Название:</td>
				<td><input class="all-width" type="name" name="name" value="'.$manufacture_name.'"></td>
			</tr>
			<tr>
				<td>Описание:</td>
				<td>
				<textarea class="all-width" style="height:150px;" name="description" >'.$manufacture_description.'</textarea></td>
			</tr>
			<tr>
				<td>Изображение:</td>
				<td>
				<img src="'.$site_url.'temp/manufacture/'.$manufacture_image.'" />
				<input type="hidden" name="old_image" value="'.$manufacture_image.'" />
				<input type="hidden" name="MAX_FILE_SIZE" value="300000" />
				<input name="image" type="file" />
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