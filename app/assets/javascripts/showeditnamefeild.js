$(function() {
    $('#edit-list-area').hide();

  $(".edit-list-name").click(function(e){
    $('.edit-list-name').hide();
    $('#edit-list-area').show();
    e.preventDefault();
  });

  $(".actions").click(function(e){
    $("#edit-list-area").hide();
  });
});
