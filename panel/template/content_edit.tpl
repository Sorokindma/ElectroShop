<?php 		
	$name = $_GET['name'];
	if(isset($_POST['confirm'])){
		$post = $_POST['content'];
		$title = $_POST['title'];
		$sql = 'UPDATE page SET `content`="'.$post.'",`title`="'.$title.'" WHERE name="'.$name.'"';	
		if(mysql_query($sql) or die(mysql_error())){
				echo '<p class="alert alert-success">Страница успешно отредактирована</p>';
			}
			else{
				echo mysql_error().'<p class="alert alert-error">Ошибка при редактировании страницы</p>';				
			}
	
	}
	
	echo '
	<form action="index.php?page=content_edit&name='.$name.'&action=edit" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	';
	$query_content = 'SELECT * FROM `page` WHERE name="'.$name.'"';
	$res_content = mysql_query($query_content);
	while($content = mysql_fetch_array($res_content)){
			echo '
				<b><input type="name" name="title" value="'.$content['title'].'"></b>
				<textarea style="height:450px;" name="content" >'.$content['content'].'</textarea>
				<input type="submit" name="confirm" value="Сохранить" />	
			';
	}
	echo '
	</form>
	';
?>