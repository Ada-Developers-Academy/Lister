$(document).ready(function() {
  $(".ajax-destroy").click(function(event) {
   var item = $(this).parents('.item');
    $.ajax({
      url: $(this).attr("href"),
      type: 'DELETE',
      dataType: 'json',
      complete: function(xhr, textStatus) {
      },
      success: function(data, textStatus, xhr) {
        item.remove();
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem deleting this item.");
      }
    });
    return false;
  });
});