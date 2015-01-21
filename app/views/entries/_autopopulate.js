var myvar;

$("#scrape-button").click(function(){
  $(".scraper-loading").show();
  $.post("/scraper", { url: $("#entry_url").val()}, function(data){

    myvar = data;
    if (myvar == -1) {
      $(".scraper-loading").hide();
      $("#entry_url").removeClass("error-border").addClass("error-border");
      $(".url-errors").remove();
      $("#entry_url").after("<div class='url-errors'>Sorry, that URL is invalid.</div>");

    } else if (myvar == -2) {
      $(".scraper-loading").hide();
      $("#entry_url").removeClass("error-border").addClass("error-border");
      $(".url-errors").remove();
      $("#entry_url").after("<div class='url-errors'>There's nothing here!</div>");
      
    } else {
      $(".scraper-loading").hide();
      $("#entry_url").removeClass("error-border");
      $(".url-errors").remove();
      document.getElementById("entry_title").value = myvar["title"];
      document.getElementById("month").value = myvar["month"];
      document.getElementById("day").value = myvar["day"];
      document.getElementById("year").value = myvar["year"];
      document.getElementById("entry_location").value = myvar["location"];
      document.getElementById("entry_body").value = myvar["body"];
      $("#select2field").select2("val", myvar["category_list"]);
    }
  });
  
});

