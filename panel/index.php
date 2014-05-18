<?php ini_set('display_errors',1);
error_reporting(E_ALL);
if(isset($_GET['page'])){
	$page = $_GET['page'];
}else{
	$page = 'home';
}
?>

<!DOCTYPE html>
<?php include('setting.tpl');
	mysql_connect($mysql_host, $mysql_user, $mysql_password) or die("Не могу соединиться с MySQL.");
	mysql_select_db($mysql_base) or die("Не могу подключиться к базе."); //Соединяемся с базой данных ?>
	<?php include('function.tpl'); ?>
	<?php include('template/header.tpl') ?>	
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
<main>
	<header>
	</header>	
	<aside>
		<?php include('template/aside.tpl') ?>	
	
	</aside>

        <!-- Add your site or application content here -->
        
		<content>

			<?php
			if($page=='content'){
				include('template/content.tpl');
			}elseif($page=='content_edit'){
				include('template/content_edit.tpl');
			}
			if($page=='manufacture'){
				include('template/manufacture.tpl');
			}elseif($page=='manufacture_edit'){
				include('template/manufacture_edit.tpl');
			}
			if($page=='goods'){
				include('template/goods.tpl');
			}elseif($page=='goods_edit'){
				include('template/goods_edit.tpl');
			}
			if($page=='category'){
				include('template/category.tpl');
			}elseif($page=='category_edit'){
				include('template/category_edit.tpl');
			}
			
			if($page=='orders'){
				include('template/orders.tpl');
			}
			?>	
		</content>

		<footer>
		
		</footer>
	</main>
    </body>
</html>
