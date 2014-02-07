$(document).ready(function() {
  $(".add").click(function() {

    var items = $(".items");
    var emptiness = $(".emptiness");

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
        var delete_button = "<a class='btn btn-default btn-xs destroy' rel='nofollow' href='/items/" + data.id + "' data-method='delete'>Delete</a>";
        items.append("<li>"+ data.name + " " + delete_button + "</li>");
        if(emptiness)
          emptiness.remove();

        // var delete_button = $( "<a/>" );
        // delete_button.addClass( "btn btn-default btn-xs destroy" );
        // delete_button.attr( "rel", "nofollow" );
        // delete_button.attr( "href", "/items/" + data.id );
        // delete_button.attr( "data-method", "delete" );
        // delete_button.text( "Delete" );

        // var delete_button = document.createElement( "a" ); 
        // delete_button.className = "btn btn-default btn-xs destroy";
        // delete_button.rel = "nofollow";
        // delete_button.href = "/items/" + data.id;
        // delete_button.setAttribute( "data-method", "delete" );
        // delete_button.innerHTML = "Delete";

        // items.append("<li>"+ data.name + " " + delete_button.outerHTML + "</li>");
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("Something has gone horribly wrong.");
      }
    });
    return false;
  });
});