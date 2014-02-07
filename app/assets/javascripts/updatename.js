$(document).ready(function() {
  $(".list-name").click(function() {

    var items = $(".name");

    $.ajax({
      url: $(this).parents('#list-form').attr("action"),
      type: 'PATCH',
      dataType: 'json',
      data: {item: {name: $("#item_name").val() }},
      success: function(data, textStatus, xhr) {
        console.log("it worked")},
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem adding this item");
      }
    });
    return false;
  });
});
