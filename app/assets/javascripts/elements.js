jQuery(document).ready(function() {
  $(".ajax-destroy").click(function() {
    var element = $(this).parents('li'); // $(this) represents the element that was clicked.
    $.ajax({
      url: $(this).attr("href"), // This gets the attribute 'href' for the clicked element
      type: 'DELETE', // The HTTP method (GET POST PATCH DELETE)
      dataType: 'json',
      success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
        element.remove(); // .remove() removes an element from the DOM
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem deleting this item.");
      }
    });
    return false
  });

  $(".ajax-create").click(function(){
    var text = $(".list-field").val()
    var id = $("#element_list_id").val()
    var list = $(".main-list")
    console.log(list)
    $.ajax({
      url: "/elements",
      type: 'POST',
      dataType: 'json',
      data: {element: { body: text, list_id: id } },
      success: function(data, textStatus, xhr) {
        list.append('<li>' + data.body + '<a class="btn btn-default btn-xs ajax-destroy" data-method="delete" href="/elements/'+ data.id +'" rel="nofollow">Delete</a></li>')
        $(".list-field").val("")
      },
      error: function(xhr, textStatus, errorThrown) {
        alert(":(");
      }
    })

    return false
  });
});