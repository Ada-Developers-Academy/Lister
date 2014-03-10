$(function() {
    $('#sign-in-area').hide();

  $(".signin").click(function(e){
    $('#sign-up-area').hide();
    $('#sign-in-area').toggle();
    e.preventDefault();
  });
});
