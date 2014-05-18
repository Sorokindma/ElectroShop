	<table class="table table-striped table-bordered table-condensed span12">	
		<tr>			
			<td>URL</td>
			<td>Название страницы</td>
			<td></td>		
		</tr>	
		<?php
		$query_content = 'SELECT * FROM `page`';
		$res_content = mysql_query($query_content);
		while($content = mysql_fetch_array($res_content)){
			echo '
		<tr>			
			<td><a href="../'.$content['name'].'" target=_blank>'.$content['name'].'</a></td>
			<td>'.$content['title'].'</td>
			<td>
				<a href="index.php?page=content_edit&name='.$content['name'].'&action=edit">Редактировать</a>
			</td>		
		</tr>';
		}
		?>
</table>