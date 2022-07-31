<!DOCTYPE html>
<html lang="en">

<head>
	<?php $this->load->view('site/head', $this->data); ?>
</head>

<body>
	<div class="container">
		<?php $this->load->view('site/header', $this->data); ?>
	</div>

	<div class="container">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding" style="margin-top: 15px;">
			<?php $this->load->view('admin/message.php'); ?>
			<?php $this->load->view($temp, $this->data); ?>
		</div>
	</div>
	<div class="container">
		<?php $this->load->view('site/contact', $this->data); ?>

	</div>
	<div class="container-fluid" style="background: #f4f4f4">
		<?php $this->load->view('site/footer', $this->data); ?>
	</div>

	<script src="<?php echo public_url('site/'); ?>bootstrap/js/bootstrap.min.js"></script>
</body>

</html>