var myvar;

$("#scrape-button").click(function(){
  $.post("/scraper", { url: $("#entry_url").val()}, function(data){
    myvar = data;
    console.log(myvar);
    window.foo = myvar;
    if (myvar == -1) {
      $("#entry_url").removeClass("error-border").addClass("error-border");
      $(".url-errors").remove();
      $("#entry_url").after("<div class='url-errors'>Sorry, that URL is invalid.</div>");

    } else if (myvar == -2) {
      $("#entry_url").removeClass("error-border").addClass("error-border");
      $(".url-errors").remove();
      $("#entry_url").after("<div class='url-errors'>There's nothing here!</div>");
      
    } else {
      $("#entry_url").removeClass("error-border")
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