<?php
if(isset($_GET['id'])){
	$manufacture_id=$_GET['id'];
	$query_manufacture= 'SELECT * FROM `manufacture` WHERE `id`="'.$manufacture_id.'"';
	$res_manufacture = mysql_query($query_manufacture);
	while($manufacture = mysql_fetch_array($res_manufacture)){
		$manufacture_id=$_GET['id'];
		echo '
			<div>	
			<img src="'.$site_url.'temp/manufacture/'.$manufacture['image'].'" />
			<h2>'.$manufacture['name'].'</h2>
			<p>'.$manufacture['description'].'</p>
			</div>';
		}
}else{
	echo '<article>';
	$query_manufacture= 'SELECT * FROM `manufacture`';
	$res_manufacture = mysql_query($query_manufacture);
	while($manufacture = mysql_fetch_array($res_manufacture)){
		echo '
			<div class="manufacture">	
			<img src="'.$site_url.'temp/manufacture/'.$manufacture['image'].'" />
			<h3>'.$manufacture['name'].'</h3>
			<p>'.mb_substr($manufacture['description'], 0, 60, 'UTF-8').'</p>
			<a href="manufacture/'.$manufacture['id'].'">Подробнее</a>
			</div>';
	}
	echo '</article>';
}

?>
