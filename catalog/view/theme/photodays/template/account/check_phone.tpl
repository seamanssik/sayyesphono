<?php echo $header; ?>
<div class="mobile-confirm-wrap">
	<div class="container">
		<span>На указанный Вами номер телефона отправлено SMS с кодом.</span>
		<span>Введите код:</span>
		<script>
		$( document ).ready(function() {
		    $("#check-phone-input").keyup(function() {
		        if($("#check-phone-input").val() == '<?php echo $short_code?>'){
		            $("#submit_button").attr("disabled", false);
		        }else{
					$("#submit_button").attr("disabled", true);
				}
		    });
		});
		</script>
		<form action="<?php echo $action;?>" method="post" id="process-phone-form">
		    <input type="text" name="validation_code" id="check-phone-input">
		    <input type="submit" value="Подтвердить" id="submit_button" class="btn btn-success" disabled>
		</form>
	</div>
</div>
<?php echo $footer; ?>
