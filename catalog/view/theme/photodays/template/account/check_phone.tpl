<?php echo $header; ?>
<div class="mobile-confirm-wrap">
	<div class="container">
		<span>На указанный Вами номер телефона отправлено SMS с кодом.</span>
		<span>Введите код:</span>
		<script>
		$( document ).ready(function() {
			$('#modalSuccessAccount').on('hidden.bs.modal', function () {
				window.location.href = "/";
			})

		    $("#check-phone-input").keyup(function() {
		        if($("#check-phone-input").val() == '<?php echo $short_code?>'){
		            $("#submit_button").attr("disabled", false);
		        }else{
					$("#submit_button").attr("disabled", true);
				}
		    });

			$("#process-phone-form").submit(function( event ) {
				event.preventDefault();

				$.ajax({
					url: 'index.php?route=account/check_phone/checker',
					type: 'post',
					data: {validation_code : $("#check-phone-input").val()},
					dataType: 'json',
					success: function(response) {
						if(response.answer == 'done'){
							$('#modalSuccessAccount').modal('show');
						}
						if(response.answer == 'fail'){
							window.location.href = "account/edit";
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				
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
