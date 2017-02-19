<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/cart.tpl 
-->
<div id="cart_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="cart_template">
	<div class="checkout-title"><span>1.</span> <%= model.countProducts %></div>

	<div class="panel panel-default <%= parseInt(model.config.display) ? '' : 'hidden' %>">

		<div class="qc-checkout-product panel-body" >
			<% if(model.config.description){ %><p class="text"><%= model.config.description %></p><% } %>
			<% if(model.error){ %>
				<% if(model.config_stock_warning){ %>
					<div class="save-alert save-alert-danger">
						<i class="fa fa-exclamation-circle"></i> <%= model.error %>
					</div>
				<% } else { %>
					<div class="alert alert-danger">
						<i class="fa fa-exclamation-circle"></i> <%= model.error %>
					</div>
				<% } %>
			<% } %>

			<div class="checkout-cart">
				<% _.each(model.products, function(product) { %>
				<div class="checkout-cart__item">
					<div class="row">
						<div class="col-sm-3 col-xs-4">
							<div class="checkout-cart__figure qc-quantity">
								<button class="delete checkout-cart__delete" data-product="<%= product.key %>"></button>
								<a href="<%= product.href %>" data-container="body" data-toggle="popover" data-placement="top" data-content='<img src="<%= product.image %>" />' data-trigger="hover">
									<img src="<%= product.thumb %>" class="img-responsive" alt="<%= product.name %>">
								</a>
								<div class="hidden input-group input-group-sm">
									<span class="input-group-btn">
										<button class="btn btn-primary decrease hidden-xs" data-product="<%= product.key %>"><i class="fa fa-chevron-down"></i></button>
									</span>
									<input type="text" data-mask="9?999999999999999" value="<%= product.quantity %>" class="qc-product-qantity form-control text-center" name="cart.<%= product.key %>"  data-refresh="2"/>
									<span class="input-group-btn">
										<button class="btn btn-primary increase hidden-xs" data-product="<%= product.key %>"><i class="fa fa-chevron-up"></i></button>
									</span>
								</div>
							</div>
						</div>
						<div class="col-sm-9 col-xs-8">
							<div class="checkout-cart__info">
								<div class="checkout-cart__title"><%= product.name %></div>
								<div class="row">
									<div class="col-lg-8 col-xs-12">
										<% _.each(product.option, function(option) { %>
										<div class="checkout-cart__option">
											<span class="label"><%= option.name %>:</span>
											<% if(!option.additions) { %>
											<span class="text"><%= option.value %></span>
											<% } else { %>
											<ul class="list-unstyled checkout-cart__additions">
												<% _.each(option.additions, function(addition) { %>
												<li class="checkout-cart__addition">
													<span class="checkout-cart__addition-name"><%= addition.name %></span>
													<span class="checkout-cart__addition-price"><%= addition.price %></span>
													<span class="checkout-cart__addition-symbol"><%= addition.symbol %></span>
												</li>
												<% }) %>
											</ul>
											<% }  %>
										</div>
										<% }) %>
									</div>
									<div class="col-lg-4 col-xs-12">
										<div class="checkout-cart__total">
											<span class="label">Итого:</span>
											<span class="text"><%= product.total %> <i><%= product.symbol %></i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="hidden">
							<div class="checkout-cart__total">
								<span class="label">Итого:</span>
								<span class="text"><%= product.total %> <i><%= product.symbol %></i></span>
							</div>
						</div>
					</div>
				</div>
				<% }) %>
			</div>
			
			<div class="form-horizontal hidden">
				<div class=" form-group qc-coupon <%= parseInt(model.config.option.coupon.display) ? '' : 'hidden' %>">
					<% if(model.errors.coupon){ %>
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<i class="fa fa-exclamation-circle"></i> <%= model.errors.coupon %>
							</div>
						</div>
					<% } %>
					<% if(model.successes.coupon){ %>
						<div class="col-sm-12">
							<div class="alert alert-success">
								<i class="fa fa-exclamation-circle"></i> <%= model.successes.coupon %>
							</div>
						</div>
					<% } %>
					<label class="col-sm-4 control-label" >
						<?php echo $text_use_coupon; ?>
					</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" value="<%= model.coupon ? model.coupon : '' %>" name="coupon" id="coupon" <% if(Number(config.design.placeholder)) {  %>placeholder="<?php echo $text_use_coupon; ?>" <% } %>  class="form-control"/>
							<span class="input-group-btn">
								<button class="btn btn-primary" id="confirm_coupon" type="button"><i class="fa fa-check"></i></button>
							</span>
						</div>
					</div>
					<% _.each(model.coupon, function(voucher) { %>
			        
			        <% }) %>
				</div>
				<div class=" form-group qc-voucher <%= parseInt(model.config.option.voucher.display) ? '' : 'hidden' %>">
					<% if(model.errors.voucher){ %>
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<i class="fa fa-exclamation-circle"></i> <%= model.errors.voucher %>
							</div>
						</div>
					<% } %>
					<% if(model.successes.voucher){ %>
						<div class="col-sm-12">
							<div class="alert alert-success">
								<i class="fa fa-exclamation-circle"></i> <%= model.successes.voucher %>
							</div>
						</div>
					<% } %>

					<label class="col-sm-4 control-label" >
						<?php echo $text_use_voucher; ?>
					</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" value="<%= model.voucher ? model.voucher : '' %>" name="voucher" id="voucher" <% if(Number(config.design.placeholder)) {  %>placeholder="<?php echo $text_use_voucher; ?>" <% } %>  class="form-control"/>
							<span class="input-group-btn">
								<button class="btn btn-primary" id="confirm_voucher" type="button"><i class="fa fa-check"></i></button>
							</span>
						</div>
					</div>
				</div>
				<?php if($reward_points) {?>
				<div class=" form-group qc-reward <%= parseInt(model.config.option.reward.display) ? '' : 'hidden' %>">
					<% if(model.errors.reward){ %>
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<i class="fa fa-exclamation-circle"></i> <%= model.errors.reward %>
							</div>
						</div>
					<% } %>
					<% if(model.successes.reward){ %>
						<div class="col-sm-12">
							<div class="alert alert-success">
								<i class="fa fa-exclamation-circle"></i> <%= model.successes.reward %>
							</div>
						</div>
					<% } %>
					<label class="col-sm-4 control-label" >
						<?php echo $text_use_reward; ?>
					</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" value="<%= model.reward ? model.reward : '' %>" name="reward" id="reward" <% if(Number(config.design.placeholder)) {  %>placeholder="<?php echo $text_use_reward; ?>" <% } %> class="form-control"/>
							<span class="input-group-btn">
								<button class="btn btn-primary" id="confirm_reward" type="button"><i class="fa fa-check"></i></button>
							</span>

						</div>
						<small><?php echo $entry_reward; ?></small>
					</div>

				</div>
				<?php } ?>
			</div>
			<% if(model.show_price){ %>
			<div class="form-horizontal qc-totals checkout-totals">
				<% _.each(model.totals, function(total) { %>
				<div class="row checkout-totals__item">
					<div class="col-ed-4 col-lg-5 col-md-5 col-sm-4 col-xs-12 checkout-totals__link"><a href="/" class="checkout-totals__link-back"><span>назад на сайт</span></a></div>
					<label class="col-ed-5 col-lg-4 col-md-4 col-sm-4 col-xs-7 control-label checkout-totals__title"><%= total.title %></label>
					<div class="col-ed-3 col-lg-3 col-md-3 col-sm-3 col-xs-5 form-control-static checkout-totals__text"><span><%= total.text %></span></div>
				</div>
				<% }) %>
			</div>
			<% } %>
			<div class="preloader row"><img class="icon" src="image/<%= config.general.loader %>" /></div>
		</div>
	</div>
</script>
<script>
$(function() {
	qc.cart = $.extend(true, {}, new qc.Cart(<?php echo $json; ?>));
	qc.cartView = $.extend(true, {}, new qc.CartView({
		el:$("#cart_view"), 
		model: qc.cart, 
		template: _.template($("#cart_template").html())
	}));

});
</script>