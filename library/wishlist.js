var wishlist = {
    'add': function(product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                var wishCount;
                $('.alert').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                }

                wishCount = json['total'].replace( /[^\d.]/g, '' );
                $('#wishlist-total span').html(wishCount);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function() {
        console.log(123);
    }
}

$( document ).ready(function() {
   $( ".account-dropdown-init" ).on( "click", function() {
        $( ".account-dropdown-init" ).parent().toggleClass('active');
    });
});




