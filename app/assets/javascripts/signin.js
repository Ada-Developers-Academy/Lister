$(function() {
    $('#sign-in-area').hide();

  $(".signin").click(function(e){
    $('#sign-up-area').hide();
    $('#sign-in-area').show();
    e.preventDefault();
  });
});
