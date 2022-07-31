<div class="row header__top">
	<div class="header__logo">
		<!-- col-xs-12 col-sm-4 col-md-4 col-lg-4 -->
		<a href="<?php echo base_url(); ?>"><img src="<?php echo base_url(); ?>upload/logo2.2.png" alt="" class="img-responsive logo-img"></a>
	</div>

	<ul class="header__link">
		<?php $this->load->view('site/cart/cart_sh'); ?>

		<?php if (!isset($user)) { ?>
			<li>
				<a href="<?php echo base_url('dang-nhap'); ?>">
					<img src="<?php echo base_url(); ?>upload/account.png" alt="" class="header__account">
				</a>
			</li>
		<?php } else { ?>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: purple;">Xin chào: <?php echo $user->name; ?>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="<?php echo base_url('user'); ?>">Tài khoản</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="<?php echo base_url('user/logout'); ?>">Đăng xuất</a></li>
				</ul>
			</li>
		<?php } ?>
	</ul>
</div>

<div class="row header__bot">
	<nav class="navbar navbar-info re-navbar">
		<div class="container-fluid re-container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">--- Menu ---</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse re-navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="navho">
						<a href="<?php echo base_url(); ?>">
							</span>Trang chủ<span class="sr-only">(current)</span>
						</a>
					</li>

					<li><a href="<?php echo base_url('moi'); ?>">Hàng Mới</a></li>

					<li><a href="<?php echo base_url('ban-chay'); ?>">Bán chạy</a></li>

					<!-- <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sản phẩm
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" id="re-dropdown-menu">
							<?php foreach ($catalog as $value) {
								$name = covert_vi_to_en($value->name);
								$name = strtolower($name);
							?>
								<li>
									<a class="product__dow" href="<?php echo base_url($name . '-c' . $value->id); ?>"><?php echo $value->name; ?></a>
								</li>
							<?php } ?>
						</ul>
					</li> -->

					<li><a href="<?php echo base_url('thoi-trang-nam-c7'); ?>">Nam</a></li>
					<li><a href="<?php echo base_url('thoi-trang-nu-c8'); ?>">Nữ</a></li>

					<li><a href="<?php echo base_url('khuyen-mai'); ?>">Sale</a></li>
				</ul>

			</div><!-- /.navbar-collapse -->

		</div><!-- /.container-fluid -->
	</nav>
</div>