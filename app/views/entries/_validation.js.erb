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

function validMonth() {
  month_val = $('#month').val()

  if ((month_val >= 1 && month_val <= 12) || month_val == "") {
    $(".month-errors").text("");
    $("#month").removeClass("error-font")
    $("#date1").removeClass("month-error-border")
  }
  else {
    $("#month").addClass("error-font")
    $("#date1").addClass("month-error-border")
    $(".month-errors").text("That month is invalid. ")
  }
}

function validDay(last_day) {
  day_val = $('#day').val()
  if ((day_val >= 1 && day_val <= last_day) || day_val == "") {
    $(".day-errors").text("");
    $("#day").removeClass("error-font")
    $("#date1").removeClass("day-error-border")
  }
  else {
    $("#day").addClass("error-font")
    $("#date1").addClass("day-error-border")
    $(".day-errors").text("That day is invalid. ")
  }
}

function validYear()  {
  year_val = $('#year').val()
  current_year = new Date().getFullYear()
  if ((year_val >= 1000 && year_val <= current_year) || year_val == "") {
    $(".year-errors").text("");
    $("#year").removeClass("error-font")
    $("#date1").removeClass("year-error-border")
  }
  else {
    $("#year").addClass("error-font")
    $("#date1").addClass("year-error-border")
    $(".year-errors").text("That year is invalid. ")
  }
}

function validDate() {
  month_val = $('#month').val()
  var month_group = ["1", "3", "5", "7", "8", "10", "12"];

  validMonth();
  validYear();
  if(month_group.indexOf(month_val) > -1) {
    validDay(31);
  } else if (month_val == 4 || month_val == 6 || month_val == 9 || month_val == 11) {
    validDay(30);
  } else if (month_val == 2) {
    validDay(29);
  } else {
    validDay(30);
  }
}

// Presence of title
$("#entry_title").blur(function(){
  fieldPresent("#entry_title", "title-error-field")
});

// Presence of date

$(".datefield").change(function(){
  month_val = $("#month").val()
  day_val = $("#day").val()
  year_val = $("#year").val()
  if ((month_val && day_val && year_val) != "") {
    $(".datefield").removeClass("error-border")
    $("div.date-error-field").remove();
  }
});

// Valid month/day

$("#month").change(function(){
  validDate();
});

$("#day").change(function(){
  validDate();
});

$("#year").change(function(){
  validDate();
});

// Presence of location

$("#entry_location").blur(function(){
  fieldPresent("#entry_location", "location-error-field")
});

// Presence of body

$("#entry_body").blur(function(){
  fieldPresent("#entry_body", "body-error-field")
});
