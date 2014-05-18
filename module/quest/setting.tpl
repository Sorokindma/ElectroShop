<?php
	/* Модуль вопросов и ответов */

	/* Database MySql 
	$mysql_host_quest='mysql.hostinger.ru';
	$mysql_base_quest='u512781881_base';
	$mysql_user_quest='u512781881_user';
	$mysql_password_quest='password';
	 mysql_set_charset('utf8'); 
	mysql_connect($mysql_host_quest, $mysql_user_quest, $mysql_password_quest) or die("Не могу соединиться с MySQL.");
	mysql_select_db($mysql_base_quest) or die("Не могу подключиться к базе."); */
	/* Соединяемся с базой данных */

	echo '<link rel="stylesheet" href="'. $site_url .'module/quest/quest.css">';
	if(isset($_POST['go'])){
		echo '<script>
		function quest(){
			$("#quest-form").show();
		}
		$(document).ready(quest);
		</script>';
	}else{
		echo '<script>
		function quest(){
			status = $("#quest-form").css("display");
			if(status = "none"){
				$("#quest-form").fadeIn(1000);
				return;
			}else if (status = "block"){
				$("#quest-form").fadeOut(1000);
				return;
			}
			
		}
		</script>';
	}

?>