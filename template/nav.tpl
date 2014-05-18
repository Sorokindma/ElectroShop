<nav>
	<li <?php active_link('about',$page); ?>>
		<a href="<?php echo $site_url; ?>about" >О компании</a>
	</li>
	<li  <?php active_link('services',$page); ?>>
		<a href="<?php echo $site_url; ?>services">Услуги</a>
	</li>	
	<li <?php active_link('goods',$page); ?>>
		<a href="<?php echo $site_url; ?>goods" >Магазин</a>
	</li>
	<li <?php active_link('manufacture',$page); ?>>
		<a href="<?php echo $site_url; ?>manufacture">Производители</a>
	</li>
	<li <?php active_link('news',$page); ?>>
		<a href="<?php echo $site_url; ?>press">Новости</a>
	</li>
	<li <?php active_link('quest',$page); ?>>
		<a href="<?php echo $site_url; ?>quest">Вопросы</a>
	</li>
	<li <?php active_link('contact',$page); ?>>
		<a href="<?php echo $site_url; ?>contact">Контакты</a>
	</li>
	
	<li style="float: right;margin: 0;">
		<div class="toolTipWrapper">
			<div class="toolTipTop"></div>
				<div class="toolTipMid">
					Кликните на корзину для покупки
				</div>
			<div class="toolTipBtm"></div>
		</div>
			
		<form action="cart" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
		<img src="<?php echo $site_url; ?>image/icons/cart.png" >
		<input type="hidden" id="shopping-cart" name="shopping-cart"/>
		<input type="submit" id="cart"/>
		</form>
	</li>
	</nav>