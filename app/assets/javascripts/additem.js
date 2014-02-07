$(document).ready(function() {
  $(".action").click(function() {

    var items = $(".items");

    $.ajax({
      url: $(this).parents('form').attr("action"),
      type: 'POST',
      dataType: 'json',
      data: {item: {name: $("#item_name").val() }},
      success: function(data, textStatus, xhr) {
        var delete_button = '<a class="delete" data-method="delete" href="/lists/'+ data.list_id +'/items/' + data.id + '" rel="nofollow">Delete</a>'
        items.append("<tr><td>"+ data.name + "</td><td>" + delete_button + "</td></tr>");
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem adding this item");
      }
    });
    return false;
  });
});
