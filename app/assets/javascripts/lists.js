$(document).ready(function() {
  $(".ajax-destroy").click(function(event) {
   var removeItem = $(this).parents('li');
    $.ajax({
      url: $(this).attr("href"),
      type: 'DELETE',
      dataType: 'json',
      complete: function(xhr, textStatus) {
      },
      success: function(data, textStatus, xhr) {
        removeItem.remove();
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem deleting this item.");
      }
    });
    return false;
  });
});


$(document).ready(function() {
  $('form#new_list_item').submit(function(event) {
    event.preventDefault();
    var valuesToSubmit = $('form').serializeArray();
    console.log(valuesToSubmit)
    $.ajax({
      url: this.url,
      type: 'POST',
      data: valuesToSubmit,
      error: function() {
        alert('There was a problem adding this item.');
      },
      success: function() {
        $('#items_list').each(function(){
          console.log(valuesToSubmit[2])
          var $li  = $("<li>").text(valuesToSubmit[2].value);
          $(this).append($li);
        });
        $("input#list_item_description").val('');
      },
      complete: function() {
      }
    });
  });
  return false;
});