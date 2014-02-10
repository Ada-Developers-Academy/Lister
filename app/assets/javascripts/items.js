jQuery(document).ready(function() {
  $(".item-list").on("click", ".destroy", function() {
    var item = $(this).parents('li') // $(this) represents the element that was clicked.
    $.ajax({
      url: $(this).attr("href"), // This gets the attribute 'href' for the clicked element
      type: 'DELETE', // The HTTP method (GET POST PATCH DELETE)
      dataType: 'json',
      success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
        item.remove() // .remove() removes an element from the DOM
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem deleting this.")
      }
    });
    return false
  });

  $("#add-item").click(function() {
    var form = $(this).parents('form') // $(this) represents the element that was clicked.
    $.ajax({
      url: form.attr("action"), // This gets the attribute 'href' for the clicked element
      type: 'POST', // The HTTP method (GET POST PATCH DELETE)
      dataType: 'json',
      data: {
        item: {
          content: $("#item_content").val(),
          list_id: $("#item_list_id").val()
        }
      },
      success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
        var li = document.createElement("li");
        var a = document.createElement("a");
        a.setAttribute("class", "destroy");
        a.setAttribute("data-method", "delete");
        a.setAttribute("href", "/item/" + data.id + "/delete");
        a.setAttribute("rel", "nofollow");
        a.innerHTML = "Destroy";
        li.innerHTML = data.content + " " + a.outerHTML;
        $(".item-list").append(li) // .remove() removes an element from the DOM
            },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem.")
      }
    });
    return false
  });
});