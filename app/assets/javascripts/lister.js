$(document).ready(function() {
  $(".destroy-list").click(function(event) {
    var list = $(this).parents('li'); // $(this) represents the element that was clicked.
    $.ajax({
      url: $('.destroy-list').attr("href"), // This gets the attribute 'href' for the clicked element
      type: 'DELETE', // The HTTP method (GET POST PATCH DELETE)
      dataType: 'json',
      success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
        list.remove(); // .remove() removes an element from the DOM
      },
      error: function(xhr, textStatus, errorThrown) {
        alert(textStatus)
      }
    });
    return false
  });
}); 