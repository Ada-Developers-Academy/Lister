jQuery(document).ready(function() {
  $(".items").on( "click", ".delete", function() {
    var item = $(this).parents('tr');
    $.ajax({
      url: $(this).attr("href"),
      type: 'DELETE',
      dataType: 'json',
    })
    .done(function(){
      item.remove();
    })
  .fail(function(){
    alert("you are a terrible person and i'm not deleting that");
  });
    return false;
  });
});
