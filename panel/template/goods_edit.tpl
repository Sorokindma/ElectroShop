<?php 
	if(isset($_GET['id'])){
		$id = $_GET['id'];	
	}
	if(isset($_POST['confirm'])){
		$description = $_POST['description'];
		$title = $_POST['title'];
		$article = $_POST['article'];
		$price = $_POST['price'];
		$units = $_POST['units'];
		$manufacture = $_POST['manufacture'];
		$category = $_POST['category'];
		$availability = $_POST['availability'];
		$old_image = $_POST['old_image'];
	if(!empty($_FILES['image']['name'])){
		$uploaddir = '../temp/goods/'; // Relative path under webroot
		$file_name = $_FILES['image']['name'];
		$file_type = substr($file_name, strrpos($file_name, '.')+1);
		$file_name = rand(1000000,9999999).'.'.$file_type;
		$uploadfile = $uploaddir . $file_name;
		if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
			$goods_image = $file_name ;
		} else {
			echo "Изображение не было загружено.\n";
		}
	}
		
		if($_GET['action']=='add'){
		if(!isset($goods_image)){
				$goods_image = 'null_image.png';
			}
			$sql = '
		INSERT INTO `goods` (`id`, `title`, `description`, `image`, `article`, `manufacture`, `price`, `category`, `units`, `availability`) VALUES (NULL, "'.$title.'", "'.$description.'",  "'.$goods_image.'", "'.$article.'", "'.$manufacture.'", "'.$price.'", "'.$category.'", "'.$units.'", "'.$availability.'")';
		if(mysql_query($sql) or die(mysql_error())){
				echo '<p class="alert alert-success">Товар успешно добавлен</p>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка при добавлении товара</p>';				
			}
			$query_goods_add = 'SELECT * FROM `goods` WHERE id=LAST_INSERT_ID();';
			$res_goods_add = mysql_query($query_goods_add);
			while($goods_add = mysql_fetch_array($res_goods_add)){
				$id = $goods_add['id'];
			}
		}elseif($_GET['action']=='edit'){
			if(!isset($goods_image)){
				if (!isset($old_image)){
					$goods_image = 'null_image.png';
				}else{
					$goods_image = $old_image;
				}
			}				
			$sql = 'UPDATE goods SET `description`="'.$description.'",`title`="'.$title.'",`article`="'.$article.'",`price`="'.$price.'",`units`="'.$units.'",`manufacture`="'.$manufacture.'",`category`="'.$category.'",`availability`="'.$availability.'",`image`="'.$goods_image.'" WHERE id="'.$id.'"';
			
			
		
		if(mysql_query($sql) or die(mysql_error())){
				echo '<p class="alert alert-success">Товар успешно изменен</p>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка при изменении товара</p>';				
			}
		}
	
	}
	

if(isset($id)){
		echo '
	<form action="index.php?page=goods_edit&id='.$id.'&action=edit" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	';
	$query_goods = 'SELECT * FROM `goods` WHERE id="'.$id.'"';
	$res_goods = mysql_query($query_goods) or die(mysql_error());
	while($goods = mysql_fetch_array($res_goods)){
		$title_form= $goods['title'];
		$article_form= $goods['article'];
		$price_form= $goods['price'];
		$units_form= $goods['units'];
		$category_form= $goods['category'];
		$availability_form= $goods['availability'];
		$manufacture_form= $goods['manufacture'];
		$description_form= $goods['description'];
		$goods_image= $goods['image'];
	}
}else{
		echo '
	<form action="index.php?page=goods_edit&action=add" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	';
	$title_form= '';
	$article_form= '';
	$price_form= '';
	$units_form= '';
	$category_form= '';
	$availability_form= '';
	$manufacture_form= '';
	$description_form= '';
	$goods_image = 'null_image.png';
}
			echo '<table>
			<tr>
				<td>Название:</td>
				<td><input class="all-width" type="name" name="title" value="'.$title_form.'"></td>
			</tr>
			<tr>
				<td>Артикул:</td>
				<td><input class="all-width" type="text" name="article" value="'.$article_form.'"></td>
			</tr>
			<tr>
				<td>Цена:</td>
				<td><input class="all-width" type="text" name="price" value="'.$price_form.'"></td>
			</tr>
			<tr>
				<td>Единицы измерения:</td>
				<td><select name="units">
					<option value="Штук" '; if($units_form=='Штук'){echo 'selected';}; echo' >Штук</option>
					<option value="Килограмм" '; if($units_form=='Килограмм'){echo 'selected';}; echo' >Килограмм</option>
					<option value="Упаковок" '; if($units_form=='Упаковок'){echo 'selected';}; echo' >Упаковок</option>
				</select></td>
			</tr>
			<tr>
				<td>В наличии:</td>
				<td><select name="availability">
					<option value="1" '; if($availability_form==1){echo 'selected';}; echo' >Есть</option>
					<option value="0" '; if($availability_form==0){echo 'selected';}; echo' >Нет</option>
				</select></td>
			</tr>
			<tr>
				<td>Производитель:</td>
				<td>';
					manufacture_select($manufacture_form);
				echo '
			</td>
			<tr>
				<td>Категория:</td>
				<td>';
					category_select($category_form);
				echo '
			</td>
			</tr>
			<tr>
				<td>Описание:</td>
				<td>
				<textarea class="all-width" style="height:150px;" name="description" >'.$description_form.'</textarea></td>
			</tr>
			<tr>
				<td>Изображение:</td>
				<td>
				<img src="'.$site_url.'temp/goods/'.$goods_image.'" />
				<input type="hidden" name="old_image" value="'.$goods_image.'" />
				<input type="hidden" name="MAX_FILE_SIZE" value="300000" />
				<input name="image" type="file" />
				</td>
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