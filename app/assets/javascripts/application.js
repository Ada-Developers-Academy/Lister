// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



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

$(document).ready(function() {
  $(".delete").click(function() {
    var item = $(this).parents('tr')
    $.ajax({
      url: $(this).attr("href"),
      type: 'DELETE',
      dataType: 'json',
      success: function(data, textStatus, xhr) {
        item.remove()
      },
      error: function(xhr, textStatus, errorThrown) {
        alert(textStatus)
      }
    });
    return false
  });
});

