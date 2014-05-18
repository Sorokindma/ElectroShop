<?php
session_start();
ini_set('display_errors',1);
error_reporting(E_ALL);
if(isset($_GET['page'])){
	$page = $_GET['page'];
}else{
	$page = 'home';
}
?>

<!DOCTYPE html>
<?php include('setting.tpl'); ?>
<?php
	mysql_connect($mysql_host, $mysql_user, $mysql_password) or die("Не могу соединиться с MySQL.");
	mysql_select_db($mysql_base) or die("Не могу подключиться к базе."); //Соединяемся с базой данных ?>
<?php include('function.tpl'); ?>
<?php include('template/header.tpl'); ?>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
<main>
	<header>
		<div class="header-block">
			<div class="header-top">
					<img src="<?php echo $site_url; ?>image/logo.png" class="logo" />
			<ul class="header-contact">
				<li>
					<img src="<?php echo $site_url; ?>image/icons/tel.png" ><h2><?php echo $site_tel; ?></h2>
				</li>
				<li>
					<img src="<?php echo $site_url; ?>image/icons/callback.png" ><h2>Обратный звонок</h2>
				</li>
				<li>
					<a href="<?php echo $site_email; ?>"><img src="<?php echo $site_url; ?>image/icons/mail.png" /><h2>Отправить e-mail</h2></a>
				</li>
			</ul>
		</div>
		<?php include('template/nav.tpl');	?>	
		</div>
		</header>
        <!-- Add your site or application content here -->
        
		<div id="page" >
			<?php
			if($page=='home'){
			echo' 
			<div id="slider">
				<img src="'.$site_url.'temp/slide.jpg" width="980" />				
			</div>';
			}
			
			include('template/aside.tpl');
			
			echo '<content>';
			
			include('template/page.tpl');

			
			if($page=='manufacture'){
				include('template/manufacture.tpl');
			}

			if($page=='goods'){
				include('template/goods.tpl');
			}
			
			if($page=='quest'){
				include('module/quest/index.tpl');
			}
			
			if($page=='cart'){
				include('template/cart.tpl');
			}
						


			?>	
		</content>


		</div> <!-- PAGE -->
		<footer>
			<?php include('template/footer.tpl'); ?>
		</footer>
	</main>
    </body>
</html>
