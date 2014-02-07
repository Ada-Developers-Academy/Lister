$(document).ready(function() {
  $(".add").click(function() {

    var items = $(".items");
    
    console.log( $("#item_name" ).val() );

    $.ajax({
      url: $(this).parents('form').attr("action"),
      type: 'POST',
      dataType: 'json',
      data: {
        item: {
          name: $("#item_name").val(),
          list_id: $("#item_list_id").val()
        }
      },
      success: function(data, textStatus, xhr) {
        var delete_button = "<a class='btn btn-default btn-xs destroy' rel='nofollow' href='/items/" + data.id + " data-method='delete'>Delete</a>";
        items.append("<li>"+ data.name + " " + delete_button + "</li>");
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("Something has gone horribly wrong.");
      }
    });
    return false;
  });
});