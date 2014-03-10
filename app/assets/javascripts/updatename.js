$(document).ready(function() {
  $(".list-name").click(function() {

    var name = $(".name");

    $.ajax({
      url: $(this).parents('#list-form').attr("action"),
      type: 'PATCH',
      dataType: 'json',
    })
    .done(function(){
      item.remove();
    })
  .fail(function(){
    alert("you are a terrible person and i'm not writing that");
  });
    return false;
  });
});
