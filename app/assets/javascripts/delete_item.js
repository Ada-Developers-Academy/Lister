$(function() {
  $(".items").on( "click", ".destroy", function() {
    var item = $(this).parents('li');
    $.ajax({
      url: $(this).attr("href"),
      type: 'DELETE',
      dataType: 'json'
    })
    .done(function(){
      item.remove();
    })
    .fail(function(){
      alert("Something has gone horribly wrong.");
    });
    return false;
  });
});