<!DOCTYPE html>
<html lang="en">

<head>
	<?php $this->load->view('site/head', $this->data); ?>
</head>

<body>
	<div class="container">
		<?php $this->load->view('site/header', $this->data); ?>

	</div>
	<div class="container-fluid">
		<?php $this->load->view('site/slider', $this->data); ?>
	</div>
	<div class="container">
		<?php $this->load->view($temp, $this->data); ?>
		<?php $this->load->view('site/contact', $this->data); ?>
	</div>
	<div class="container-fluid" style="background: #f4f4f4">
		<?php $this->load->view('site/footer', $this->data); ?>
	</div>
	<script src="<?php echo public_url('site/'); ?>bootstrap/js/bootstrap.min.js"></script>
</body>

</html>