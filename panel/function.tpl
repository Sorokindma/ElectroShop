<?php
function manufacture_select($id){
	echo '<select name="manufacture">';
	$query_manufacture= 'SELECT * FROM `manufacture`';
	$res_manufacture = mysql_query($query_manufacture);
	while($manufacture = mysql_fetch_array($res_manufacture)){
		if ($manufacture['id']==$id){
			echo '<option value="'.$manufacture['id'].'" selected>'.$manufacture['name'].'</option>';
		}else{
			echo '<option value="'.$manufacture['id'].'">'.$manufacture['name'].'</option>';
		}
	}
	echo '</select>';
}

function category_select($id){
	echo '<select name="category">';
	$query_category= 'SELECT * FROM `category`';
	$res_category = mysql_query($query_category);
	while($category = mysql_fetch_array($res_category)){
	$category_top[$category['id']] = array(
	'id'=>$category['id'],
	'title'=>$category['title'],
	'nesting'=>$category['nesting']);
	}
	$category_top_step = $category_top;
	foreach($category_top as $value){
		if($value['nesting']==0){
			echo '<br /><option value="'.$value['id'].'">'.$value['title'].'</option>';
				foreach($category_top_step as $value2){
					if($value2['nesting']==$value['id']){
						echo '<option '. category_selected($id,$value2['id']).' value="'.$value2['id'].'">&nbsp;&nbsp;'.$value2['title'].'</option>';
					}
				}
			}
	}
	echo '</select>';
}

function category_selected($id,$array_id){
		if ($id==$array_id){
			return 'selected';
		}
}
?>