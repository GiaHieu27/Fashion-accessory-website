<div class="col-xs-12 col-sm-9 col-md-9 col-lg-12 clearpaddingr">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
		<ol class="breadcrumb">
			<li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
			<li class="active">Chi tiết giỏ hàng</li>
		</ol>
		<?php if (isset($message) && !empty($message)) { ?>
			<h2 style="color: #9900FF; text-align: center;"><?php echo $message; ?></h2>
		<?php }
		if ($total_items > 0) { ?>
			<div class="panel-info " style="margin-bottom: 15px">
				<div class="primary" style="margin-top: 20px;">
					<h3 style="border: none;">
						GIỎ HÀNG ( <?php echo $total_items; ?> sản phẩm )
					</h3>
				</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<th>STT</th>
							<th>Tên sản phẩm</th>
							<th>Hình ảnh</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
							<th>Xóa</th>
						</thead>
						<tbody>
							<?php
							$i = 0;
							$total_price = 0;
							foreach ($carts as $items) {
								$total_price = $total_price + $items['subtotal']; ?>
								<tr>
									<td><?php echo $i = $i + 1 ?></td>
									<td><?php echo $items['name']; ?></td>
									<td>
										<img src="<?php echo base_url('upload/product/' . $items['image_link']); ?>" class="img-thumbnail" alt="" style="width: 50px;">
									</td>
									<td style="position: relative;">
										<a class="cart-sumsub" href="<?php echo base_url('cart/update/' . $items['id'] . '/sub'); ?>">
											-
										</a>

										<input type="text" value="<?php echo $items['qty']; ?>" style="width: 30px;text-align: center;" disabled>

										<a class="cart-sumsub" href="<?php echo base_url('cart/update/' . $items['id'] . '/sum'); ?>" style="position: absolute; height: 26px;">
											+
										</a>
									</td>
									<td>
										<?php echo number_format($items['subtotal']); ?> VNĐ
									</td>
									<td>
										<a href="<?php echo base_url('cart/del/' . $items['id']); ?>">
											<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										</a>
									</td>
								</tr>
							<?php	}
							?>

							<tr>
								<td colspan="4">Tổng tiền</td>
								<td style="font-weight: bold;color: #9900FF"><?php echo number_format($total_price); ?> VNĐ</td>
								<td>
									<a style="font-weight: bold;color: red" href="<?php echo base_url('cart/del'); ?>">
										Xóa toàn bộ
									</a>
								</td>
							</tr>
							<tr>

								
								</tr>
							</tbody>
						</table>
						
						<a href="<?php echo base_url('order'); ?>">
							<button class="btn__sidebar">
								Đặt mua
	
							</button>
						</a>
					</div>
			</div>
		<?php } else { ?>
			<div class="panel-info " style="margin-bottom: 15px">
				<div class="panel-body">
					<div class="text-center">
						<img src="<?php echo base_url('upload/empty-cart.png'); ?>" alt="cart-empty" style="width: 600px; margin: auto;">
						<h4 style="color:red">
							Giỏ hàng của bạn chưa có gì cả
						</h4>
						<a href="<?php echo base_url('product/hot'); ?>">
							<button class="btn__sidebar">
								Mua sắm ngay
							</button>
						</a>
					</div>
				</div>
			</div>
		<?php }
		?>
	</div>
</div>