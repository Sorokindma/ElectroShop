<?php
include('module/quest/setting.tpl');

/* Обрабатываем поступивший вопрос */
	if(isset($_POST['go'])){
		if(!empty($_POST['name'])){$content_name = mysql_fetch_array($_POST['name']);}else{$content_name = '';};
		if(!empty($_POST['quest'])){$content_quest = mysql_fetch_array($_POST['quest']);}else{$content_quest = '';};
		if(!empty($_POST['captha'])){$content_captha = mysql_fetch_array($_POST['captha']);}else{$content_captha = '';};
		$content_date = date('d-m-Y');
		if($content_captha==$_SESSION['secpic']){
			$sql_quest = 'INSERT INTO `quest` (`id`, `name`, `content`, `date`, `level`) VALUES (NULL, "'.$content_name.'", "'.$content_quest.'",  "'.$content_date.'", "0")';
			if(mysql_query($sql_quest)){
				echo '<p class="alert alert-success">Вопрос успешно добавлен</p>';
			}
			else{
				echo '<p class="alert alert-error">Ошибка при добавлении вопроса</p>';				
			}
		}else{
			echo 'Введите проверочный код еще раз';
		}
	}else{
		$content_name = '';
		$content_quest = '';
		$content_captha = '';
	}
?>

<a href="#" class="button" onclick="quest()">Задать вопрос</a>
		<form id="quest-form" action="quest" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			<table>
			<tr>
				<td>
				<label>Имя:</label><br />
				<input type="text" name="name" value="<?php  echo $content_name; ?>"></td>
			</tr>
			<tr>
				<td>
				<label>Вопрос:</label><br />
				<input type="text" name="quest" value="<?php  echo $content_quest; ?>"></td>
			</tr>
			<tr>
				<td>
				<label>Введите проверочный код, чтобы доказать,что вы не робот. Код вводится МАЛЕНЬКИМИ РУССКИМИ буквами.</label><br />
				<img src="module/quest/captha.php" alt="" />
				<input type="text" name="captha" value="<?php  echo $content_captha; ?>"></td>
			</tr>
			<tr>
				<td>
				<input type="submit" name="go" value="Задать вопрос">
				</td>
			</tr>
			</table>
	</form>
	
<?php	
/* Список вопросов и ответов */	
	$query_quest= 'SELECT * FROM `quest`';
	$res_quest = mysql_query($query_quest);
	while($quest_array = mysql_fetch_array($res_quest)){
	$quest[$quest_array['id']] = array(
	'id'=>$quest_array['id'],
	'name'=>$quest_array['name'],
	'level'=>$quest_array['level'],
	'date' => $quest_array['date'],
	'content' => $quest_array['content']);
	}
	$quest_step = $quest;
	foreach($quest as $value){
		if($value['level']==0){
			echo '
				<div class="quest">
					<h3>'.$value['name'].'</h3>
					<p>'.$value['date'].'</p>
					<p>'.$value['content'].'</p>
				</div>
			';
			foreach($quest_step as $value2){
				if($value2['level']==$value['id']){
			echo '
				<div class="answer">
					<h5>'.$value2['name'].'</h5>
					<p>'.$value2['date'].'</p>
					<p>'.$value2['content'].'</p>
				</div>
			';
				}
			}
		}
	}

	
?>	
