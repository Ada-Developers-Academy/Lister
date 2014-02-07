$(document).ready(function() {
  $(".delete").click(function() {
    var item = $(this).parents('li')
    $.ajax({
      url: $(this).attr("href"),
      type: 'DELETE',
      dataType: 'json',
      success: function(data, textStatus, xhr) {
        item.remove()
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem deleting this item.")
      }
    });
    return false
  });
});
