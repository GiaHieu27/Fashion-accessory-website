	<meta charset="UTF-8">
	<title>FISHHOOD</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src="<?php echo public_url(); ?>js/jquery-3.1.1.js" type="text/javascript"></script>
	<script src="<?php echo public_url('js/jqzoom_ev'); ?>js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<?php echo public_url('site/'); ?>bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<?php echo public_url('site/'); ?>css/style.css">
	<link rel="stylesheet" type="text/css" href="<?php echo public_url('site/'); ?>css/style1.css">
	
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

	<script type="text/javascript" src="<?php echo public_url('js/raty/jquery.raty.min.js') ?>"></script>
	<script type="text/javascript">
		$(function() {
			$.fn.raty.defaults.path = "<?php echo public_url('js/raty/img'); ?>";
			$('.raty').raty({
				score: function() {
					return $(this).attr('data-score');
				},
				readOnly: true,
			});
		});
	</script>
	<style>
		.raty img {
			width: 16px !important;
			height: 16px;
		}
	</style>