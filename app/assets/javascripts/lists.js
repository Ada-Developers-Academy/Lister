$(document).ready(function (){
  $('#new_list_item').submit(function (event){
    event.preventDefault();
    $.post($(this).attr('action'), $(this).serialize(), null, "script");
  });
  $(".ajax-destroy").click(function(event) {
    var item = $(this).parents('li');
    $.ajax({
      url: $(this).attr("href"),
      type: 'DELETE',
      dataType: 'json',
      complete: function(xhr, textStatus) {
      },
      success: function(data, textStatus, xhr) {
        item.remove();
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem deleting this item.");
      }
    });
      return false;
  });
});

// I came up with a neater way to do this but I was proud of myself for really brute forcing this out so I'm leaving it as evidence that I can sorta javascript.
// $(document).ready(function() {
//   $('form#new_list_item').submit(function(event) {
//     event.preventDefault();
//     var valuesToSubmit = $('form').serializeArray();
//     $.ajax({
//       url: this.url,
//       type: 'POST',
//       data: valuesToSubmit,
//       error: function() {
//         alert('There was a problem adding this item.');
//       },
//       success: function() {
//         $('#items_list').each(function(){
//           var $li  = $("<li>").text(valuesToSubmit[2].value);
//           $(this).append($li);
//         });
//         $("input#list_item_description").val('');
//       },
//       complete: function() {
//       }
//     });
//   });
//   return false;
// });