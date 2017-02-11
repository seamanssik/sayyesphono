<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/confirm.tpl 
-->
<div id="confirm_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="confirm_template">
<div id="confirm_wrap">
	<div class="panel panel-default checkout-panel">
		<div class="panel-heading checkout-panel__heading">
			<h4 class="panel-title checkout-panel__title">
				<span class="text checkout-panel__text">Комментарии к заказу:</span>
			</h4>
		</div>
		<div class="panel-body checkout-panel__body">
			<form id="confirm_form" class="form-horizontal"></form>
		</div>
	</div>
	<div class="checkout-confirm">
		<button id="qc_confirm_order" class="btn btn-primary btn-lg btn-block checkout-confirm__button" <%= model.show_confirm ? '' : 'disabled="disabled"' %>><span><% if(Number(model.payment_popup)) { %><?php echo $button_continue; ?><% }else{ %><?php echo $button_confirm; ?><% } %></span></button>
	</div>
</div>
</script>
<script>
	$(function() {
		qc.confirm = $.extend(true, {}, new qc.Confirm(<?php echo $json; ?>));
		qc.confirmView = $.extend(true, {}, new qc.ConfirmView({
			el:$("#confirm_view"),
			model: qc.confirm,
			template: _.template($("#confirm_template").html())
		}));
	});
</script>