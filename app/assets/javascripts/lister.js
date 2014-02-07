$(document).ready(function() {
  
// removing an item
$(".list").on("click", ".remove-item", function(event) {
    event.preventDefault();
    event.stopPropagation();
    var item = $(this).parents('li'); 
    $.ajax({
      url: $(this).attr("href"), 
      type: 'DELETE', 
      dataType: 'json',
      success: function(data, textStatus, xhr) { 
        item.remove();
        console.log(data); 
        console.log("Item removed!"); 
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem removing the item!")
      }
    });
    return false
  });

// removing a list
  $(".destroy-list").click(function(event) {
    var list = $(this).parents('li'); 
    $.ajax({
      url: $('.destroy-list').attr("href"), 
      type: 'DELETE', 
      dataType: 'json',
      success: function(data, textStatus, xhr) { 
        list.remove();
        console.log("List removed!"); 
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem removing the list!")
      }
    });
    return false
  });

// adding an item to a list

  $(".add-button").click(function(event) {
    event.preventDefault();
    event.stopPropagation();

    $.ajax({
      url: $('.form').find('form').attr('action'),
      data: "list[item_name]=" + $('#list_item_name').val(),
      type: "PATCH",
      dataType: 'json',
      success: function(data, textStatus, xhr) { 
        var btn = $('<a/>', {
            class: 'remove-item',
            href: "/lists/" + data.list_id + "/item/" + data.id,
            rel: 'nofollow',
            text: 'Remove',
            "data-method": 'delete'
        });
        console.log(data);
        $('.list').find('ul').append("<li>" + $('#list_item_name').val() + "</li>");
        $('.list').find('ul').append(btn);

        console.log("Item added!"); 

      },
      error: function(data, textStatus, xhr) {
        alert('You didn\'t enter anything!')
      }
    });
    return false

  });
}); 