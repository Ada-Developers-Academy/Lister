jQuery(document).ready(function() {
  console.log("IT HAPPENED");
  $(".list-item").on("click", ".ajax-destroy", (function() {
      var item = $(this).parents('li')// $(this) represents the element that was clicked.    
      $.ajax({
          url: $(this).attr("href"),// This gets the attribute 'href' for the clicked element      
          type: 'DELETE',// The HTTP method (GET POST PATCH DELETE)      
          dataType: 'json',
          success: function(data, textStatus, xhr) {// What to do after the request succesfully completes    
            item.remove();// .remove() removes an element from the DOM
          },
          error: function(xhr, textStatus, errorThrown) {
            alert("There was a problem deleting this item.");
          };
      });
      return false
    }))
});