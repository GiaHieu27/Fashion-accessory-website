<div class="col-xs-12 col-sm-9 col-md-9 col-lg-12 clearpaddingr">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
		<ol class="breadcrumb">
			<li><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
			<li><a href="<?php echo base_url('catalog/' . $catalog_product->id); ?>"><?php echo $catalog_product->name; ?></a></li>
			<li class="active"><?php echo $product->name; ?></li>
		</ol>

		<!-- zoom image -->
		<script src="<?php echo public_url('js'); ?>/jqzoom_ev/js/jquery.jqzoom-core.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<?php echo public_url('js'); ?>/jqzoom_ev/css/jquery.jqzoom.css" type="text/css">
		<script type="text/javascript">
			$(document).ready(function() {
				$('.jqzoom').jqzoom({
					zoomType: 'standard',
				});
			});
			// $(document).ready(function() {
			// 	$(".jqzoom").jqueryzoom({
			// 		xzoom: 300, //zooming div default width(default width value is 200)
			// 		yzoom: 300, //zooming div default width(default height value is 200)
			// 		offset: 40, //zooming div default offset(default offset value is 10)
			// 		position: "right", //zooming div position(default position value is "right")
			// 		preload: 1, // preload of images :1 by default
			// 		lens: 1 // lens over the image   1 by default
			// 	});
			// });
		</script>
		<!-- end zoom image -->
		<script type="text/javascript">
			$(document).ready(function() {
				//raty
				$('.raty_detailt').raty({
					score: function() {
						return $(this).attr('data-score');
					},
					half: true,
					click: function(score, evt) {
						var rate_count = $('.rate_count');
						var rate_count_total = rate_count.text();
						$.ajax({
							url: '<?php echo base_url('product/raty'); ?>',
							type: 'POST',
							data: {
								'id': '<?php echo $product->id; ?>',
								'score': score
							},
							dataType: 'json',
							success: function(data) {
								if (data.complete) {
									var total = parseInt(rate_count_total) + 1;
									rate_count.html(parseInt(total));
								}
								alert(data.msg);
							}
						});
					}
				});
			});
		</script>
		<!--End Raty -->

		<div class="panel-info ">
			<div class="primary" style="margin-top: 50px;">
				<h3>Chi tiết sản phẩm</h3>
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-5" style="padding: 0">
					<div class="text-center">
						<a href="<?php echo base_url(); ?>upload/product/<?php echo $product->image_link; ?>" class="jqzoom" rel="gal1" title="triumph">
							<img class="detail__img" src="<?php echo base_url(); ?>upload/product/<?php echo $product->image_link; ?>" alt="">
						</a>
						<div class="clearfix"></div>
						<ul id="thumblist" style="margin-top: 20px;">
							<li>
								<a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<?php echo base_url(); ?>/upload/product/<?php echo $product->image_link ?>',largeimage: '<?php echo base_url(); ?>/upload/product/<?php echo $product->image_link ?>'}">
									<img src='<?php echo base_url(); ?>/upload/product/<?php echo $product->image_link ?>'>
								</a>
							</li>
							<?php if (is_array($image_list)) : ?>
								<?php foreach ($image_list as $value) { ?>
									<li>
										<a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<?php echo base_url(); ?>/upload/product/<?php echo $value ?>',largeimage: '<?php echo base_url(); ?>/upload/product/<?php echo $value ?>'}">
											<img src='<?php echo base_url(); ?>/upload/product/<?php echo $value; ?>'>
										</a>
									</li>
								<?php } ?>
							<?php endif; ?>
						</ul>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-1"></div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="padding: 0">
					<h1 class="detail__name">
						<?php echo $product->name; ?>
					</h1>
					<?php
					if ($product->discount > 0) {
						$price_new = $product->price - $product->discount;
					?>
						<div class="detail__price">
							<p>
								<del style="font-size: 17px;"><?php echo number_format($product->price) ?> VNĐ</del>
								<span class="price__now">
									<?php echo number_format($price_new); ?>VNĐ
								</span>
							</p>
						</div>
					<?php } else { ?>
						<div class="detail__price">
							<p>
								<span class="price__now" style="margin-left: 0;"><?php echo number_format($product->price); ?> VNĐ</span>
							</p>
						</div>
					<?php
					}
					?>
					<div class="detail__content"><?php echo $product->content; ?></div>
					<p class="detail__view">Số lượt xem: <?php echo $product->view; ?></p>
					<p>
						Đánh giá &nbsp;
						<?php $raty_tb = $product->rate_total / $product->rate_count; ?>
						<span class='raty_detailt' style='margin:5px' id='<?php echo $product->id; ?>' data-score='<?php echo round($raty_tb, 2); ?>'></span>
						| Tổng số: <b class='rate_count'><?php echo $product->rate_count; ?></b>
					</p>
					<a href="<?php echo base_url('cart/add/' . $product->id); ?>">
						<button class="btn__purple" style="margin-top: 30px">
							Mua ngay
						</button>
					</a>
				</div>
			</div>
		</div>
		<div class="panel-info">

			<h3 class="product_title text-center">Sản phẩm liên quan</h3>

			<div class="panel-body" style="padding: 30px 0 0 0;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
					<?php foreach ($productsub as $value) {
						$name = covert_vi_to_en($value->name);
						$name = strtolower($name);
					?>
						<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 re-padding" style="width: 23%;     margin: 0 11px 60px 11px;">
							<div class="product_item">
								<div class="product-image">
									<a href="<?php echo base_url($name . '-p' . $value->id); ?>">
										<img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>" alt="" class="">
									</a>
								</div>
								<p class="product_name">
									<a href="<?php echo base_url($name . '-p' . $value->id); ?>">
										<?php echo $value->name; ?>
									</a>
								</p>
								<?php if ($value->discount > 0) {
									$new_price = $value->price - $value->discount; ?>
									<p class="product__count">
										<span class='price text-right'>
											<?php echo number_format($new_price); ?> VNĐ</span>
										<del class="product-discount">
											<?php echo number_format($value->price); ?> VNĐ
										</del>
									</p>
								<?php } else { ?>
									<p>
										<span class='price text-right'><?php echo number_format($value->price); ?> VNĐ
										</span>
									</p>
								<?php	} ?>
								<!-- <p>
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true" title="Số lượt xem">

									</span>
									<?php echo $value->view; ?>
									<span class="glyphicon glyphicon-star-empty" aria-hidden="true" title="Số lượng đặt mua">
										<?php echo $value->buyed; ?>
								</p> -->
								<a href="<?php echo base_url('cart/add/' . $value->id); ?>">
									<button class='btn__sidebar'>
										Mua ngay
									</button>
								</a>
							</div>
						</div>
					<?php } ?>
				</div>

				

			</div>
		</div>
		<div class="panel-info">

			<h3 class="product_title text-center">Có thể bạn thích</h3>

			<div class="panel-body" style="padding: 30px 0 0 0;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding" style="margin-bottom: 60px;">
					<?php foreach ($productview as $value) {
						$name = covert_vi_to_en($value->name);
						$name = strtolower($name);
					?>
						<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 re-padding" style="width: 23%;     margin: 0 11px 60px 11px;">
							<div class="product_item">
								<div class="product-image">
									<a href="<?php echo base_url($name . '-p' . $value->id); ?>">
										<img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>">
									</a>
								</div>
								<p class="product_name">
									<a href="<?php echo base_url($name . '-p' . $value->id); ?>">
										<?php echo $value->name; ?>
									</a>
								</p>
								<?php if ($value->discount > 0) {
									$new_price = $value->price - $value->discount; ?>
									<p class="product__count">
										<span class='price text-right'>
											<?php echo number_format($new_price); ?> VNĐ
										</span>
										<del class="product-discount">
											<?php echo number_format($value->price); ?> VNĐ
										</del>
									</p>
								<?php } else { ?>
									<p>
										<span class='price text-right'>
											<?php echo number_format($value->price); ?> VNĐ
										</span>
									</p>
								<?php	} ?>
								<!-- <p>
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true" title="Số lượt xem"></span> <?php echo $value->view; ?> <span class="glyphicon glyphicon-star-empty" aria-hidden="true" title="Số lượng đặt mua"><?php echo $value->buyed; ?></p> -->
								<a href="<?php echo base_url('cart/add/' . $value->id); ?>">
									<button class='btn__sidebar'>
										Mua ngay
									</button>
								</a>
							</div>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
