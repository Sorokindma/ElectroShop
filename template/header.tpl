<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link rel="stylesheet" href="<?php echo $site_url; ?>css/normalize.css">
        <link rel="stylesheet" href="<?php echo $site_url; ?>css/main.css">
		<link rel="stylesheet" href="<?php echo $site_url; ?>css/electro.css">
		
        <script src="<?php echo $site_url; ?>js/jquery.min.js"></script>
        <script src="<?php echo $site_url; ?>js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="<?php echo $site_url; ?>js/plugins.js"></script>
        <script src="<?php echo $site_url; ?>js/jquery.session.js"></script>
		<?php 
		if($page!='cart'){
			echo '<script src="'. $site_url.'js/tooltip.js"></script>';
		} 
		?>
		<script src="<?php echo $site_url; ?>js/main.js"></script>
    </head>
