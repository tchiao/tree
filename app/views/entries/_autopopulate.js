var myvar;

$("#scrape-button").click(function(){
  $(".scraper-loading").show();
  $.post("/scraper", { url: $("#entry_url").val()}, function(data){

    myvar = data;
    if (myvar === "invalid_url") {
      $(".scraper-loading").hide();
      $("#entry_url").removeClass("error-border").addClass("error-border");
      $(".url-errors").remove();
      $("#entry_url").after("<div class='url-errors'>Sorry, that URL is invalid.</div>");

    } else if (myvar == "blank_url") {
      $(".scraper-loading").hide();
      $("#entry_url").removeClass("error-border").addClass("error-border");
      $(".url-errors").remove();
      $("#entry_url").after("<div class='url-errors'>There's nothing here!</div>");
      
    } else {
      $(".scraper-loading").hide();
      $("#entry_url").removeClass("error-border");
      $(".url-errors").remove();
      document.getElementById("entry_title").value = myvar["title"];
      document.getElementById("start_month").value = myvar["month"];
      document.getElementById("start_day").value = myvar["day"];
      document.getElementById("start_year").value = myvar["year"];
      document.getElementById("entry_location").value = myvar["location"];
      document.getElementById("entry_body").value = myvar["body"];
      $("#select2field").select2("val", myvar["category_list"]);
    }
  });
  
});

