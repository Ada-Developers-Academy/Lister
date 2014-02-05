$(function() {
    $('#sign-in-area').hide();

  $(".signin").click(function(e){
    console.log("yeash")
    $('#sign-up-area').hide();
    $('#sign-in-area').toggle();
    e.preventDefault();
  });
});
