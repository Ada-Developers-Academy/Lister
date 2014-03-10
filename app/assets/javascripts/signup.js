$(function() {
    $('#sign-up-area').hide();

  $(".signup").click(function(e){
    $('#sign-in-area').hide();
    $('#sign-up-area').toggle();
    e.preventDefault();
  });
});
