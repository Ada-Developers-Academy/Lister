$(document).ready(function() {
  
$(".remove-item").click(function(event) {
    var item = $(this).parents('li'); // $(this) represents the element that was clicked.
    $.ajax({
      url: $('.remove-item').attr("href"), // This gets the attribute 'href' for the clicked element
      type: 'DELETE', // The HTTP method (GET POST PATCH DELETE)
      dataType: 'json',
      success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
        item.remove();
        alert("item removed!"); 
         // .remove() removes an element from the DOM
      },
      error: function(xhr, textStatus, errorThrown) {
        alert(textStatus)
      }
    });
    return false
  });

  $(".destroy-list").click(function(event) {
    var list = $(this).parents('li'); // $(this) represents the element that was clicked.
    $.ajax({
      url: $('.destroy-list').attr("href"), // This gets the attribute 'href' for the clicked element
      type: 'DELETE', // The HTTP method (GET POST PATCH DELETE)
      dataType: 'json',
      success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
        list.remove();
        alert("list removed!"); 
         // .remove() removes an element from the DOM
      },
      error: function(xhr, textStatus, errorThrown) {
        alert(textStatus)
      }
    });
    return false
  });

  $(".add-button").click(function(event) {
    // var $el = $("<li>hello</li>")
    // $('#list_item_name').val()
    $.ajax({
      url: $('.form').find('form').attr('action'),
      data: "list[item_name]=" + $('#list_item_name').val(),
      type: "PATCH",
      dataType: 'json',
      success: function(data, textStatus, xhr) { 
        console.log(data);
        $('.list').find('ul').append("<li>" + $('#list_item_name').val() + "</li>");
        alert("item added!"); 

      },
      error: function(data, textStatus, xhr) {
        alert('error!')
      }
    });
    return false

  });
}); 