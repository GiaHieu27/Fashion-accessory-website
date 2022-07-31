<div class="col-xs-12 col-sm-9 col-md-9 col-lg-12 clearpaddingr">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
		<ol class="breadcrumb">
			<li><a href="<?php echo base_url(); ?>#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
			<li class="active">Thanh toán</li>
		</ol>
		<?php if (isset($message) && !empty($message)) { ?>
			<h4 style="color:green;text-align: center;margin-top: 30px"><?php echo $message; ?></h4>
		<?php } ?>
		<div class="col-md-8 clearpadding">
			<div class="panel-info">
				<div class="primary" style="margin-top: 20px;">
					<h3 style="border: none;">
						Thông tin thanh toán
					</h3>
				</div>
				<div class="panel-body">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
						<h3 style="margin:0">Tổng số tiền thanh toán là: <?php echo number_format($total_amount); ?> VNĐ</h3>
						<form enctype="multipart/form-data" method="post">
							<table class="table table__order">
								<tbody>
									<tr>
										<td>Họ và tên</td>
										<td><input type="text" value="<?php echo (!empty($user)) ? $user->name : ''; ?>" name="name"><?php echo form_error('name'); ?></td>

									</tr>
									<tr>
										<td>Email</td>
										<td><input name="email" type="text" value="<?php echo (!empty($user)) ? $user->email : ''; ?>"><?php echo form_error('email'); ?></td>
									</tr>
									<tr>
										<td>Số điện thoại</td>
										<td><input name="phone" type="text" value="<?php echo (!empty($user)) ? $user->phone : ''; ?>"><?php echo form_error('phone'); ?></td>
									</tr>
									<tr>
										<td>Địa chỉ</td>
										<td><input name="address" type="text" value="<?php echo (!empty($user)) ? $user->address : ''; ?>"><?php echo form_error('address'); ?></td>
									</tr>
									<!-- <tr>
										<td>Lời nhắn</td>
										<td><textarea name="message" id="" cols="50" rows="4"></textarea><?php echo form_error('message'); ?></td>
									</tr> -->

								</tbody>
							</table>
							<input type="submit" class="btn__sidebar" style="font-size: 20px"></input>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>