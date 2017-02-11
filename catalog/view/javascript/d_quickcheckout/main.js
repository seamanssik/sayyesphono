if (!window.console) window.console = {}; //IE fix
if (!window.console.log) window.console.log = function (){}; //IE fix

var qc = qc || {};
var focused = window;
qc.event = _.extend({}, Backbone.Events);
qc.confirmOrderVar = 0;
qc.payment_address_waiting = {};
qc.shipping_address_waiting = {};
qc.statistic = qc.statistic || {};

 $.fn.serializeObject = function() {
      var o = {};
      var a = this.serializeArray();
      $.each(a, function() {
          if (o[this.name] !== undefined) {
              if (!o[this.name].push) {
                  o[this.name] = [o[this.name]];
              }
              o[this.name].push(this.value || '');
          } else {
              o[this.name] = this.value || '';
          }
      });
      return o;
    };

function preloaderStart(){
  $('#qc_confirm_order').prop('disabled', true);
  if(is_touch_device()){
    
  }else{
    if ($('#qc_confirm_order:hover').length>0) qc.confirmOrderVar = 1;  else qc.confirmOrderVar = 0;
  }
  
  // console.log('qc.confirmOrderVar = '+ qc.confirmOrderVar)
  $('.preloader').delay(500).fadeIn(300);
}
function is_touch_device() {
  return 'ontouchstart' in window;
}

function preloaderStop(){
  $('#qc_confirm_order').prop('disabled', false);
  $('.preloader').stop(true,true).fadeOut(300);
}

function sformat(pattern, address){
  var result = pattern;
  result = result.replace(/\{firstname\}/g, '<strong>'+address.firstname);
  result = result.replace(/\{lastname\}/g, address.lastname+'</strong>');
  result = result.replace(/\{company\}/g, address.company);
  result = result.replace(/\{address_1\}/g, address.address_1);
  result = result.replace(/\{address_2\}/g, address.address_2);
  result = result.replace(/\{city\}/g, address.city);
  result = result.replace(/\{zone\}/g, address.zone);
  result = result.replace(/\{country\}/g, address.country);
  result = result.replace(/\{postcode\}/g, address.postcode);
  result = result.replace(/\{zone_code\}/g, address.zone_code);
  result = result.replace(/^\s*\n/gm, "");
  result = result.replace(/^\s+|\s+$/g, "");
 
  return result;
}
