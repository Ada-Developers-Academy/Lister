$(function() {
    $('#sign-up-area').hide();
});

$('body').on('click','signin', function(e) {
    $('#sign-up-area').show();
    $('#sign-up-area').hide();
    $($(this).attr('href')).show();
    e.preventDefault();
});
