function fieldPresent(id, div_class) {
  new_val = $(id).val()
  if (new_val.length == 0) {
    $(id).removeClass("error-border").addClass("error-border");
    $("div." + div_class).remove();
    $(id).after("<div class=" + div_class + ">Sorry, this field cannot be blank!</small>")
  }
  else {
    $(id).removeClass("error-border")
    $("div." + div_class).remove();
  }
}

// Presence of title
$("#entry_title").blur(function(){
  fieldPresent("#entry_title", "title-error-field")
});

// Valid month/day

$("#month").change(function(){
  new_val = $(this).val()
  if(new_val < 1 || new_val > 12) {
    $("#month").addClass("error-font")
    $("#date1").addClass("month-error-border")
    $(".month-errors").append("That month is invalid. ")
  }
  else {
    $(".month-errors").remove();
    $("#month").removeClass("error-font")
    $("#date1").removeClass("month-error-border")
  }
});

$("#day").change(function(){
  new_val = $(this).val()
  if(new_val < 1 || new_val > 31) {
    $("#day").addClass("error-font")
    $("#date1").addClass("day-error-border")
    $(".day-errors").append("That day is invalid. ")
  }
  else {
    $(".day-errors").remove();
    $("#day").removeClass("error-font")
    $("#date1").removeClass("day-error-border")
  }
});

// Presence of location

$("#entry_location").blur(function(){
  fieldPresent("#entry_location", "location-error-field")
});

// Presence of body

$("#entry_body").blur(function(){
  fieldPresent("#entry_body", "body-error-field")
});

$('#new_entry').on('submit', function() {
  $('#entry_modal').modal('hide');
});

$('#edit_entry').on('submit', function() {
  $('#entry_modal').modal('hide');
});
