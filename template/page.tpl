<?php 
	$content = page_content($page);
	echo '<h2>' . $content['title'] . '</h2>';
	echo '<article>' .$content['content'].'</article>';
?>