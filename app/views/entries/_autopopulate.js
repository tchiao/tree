function validURL(url) {
  url_val = $("#entry_url").val();
}
var myvar;

$("#scrape-button").click(function(){
  $.post("/scraper", { url: $("#entry_url").val()}, function(data){
    console.log(data);
    myvar = data;

    document.getElementById("entry_title").value = myvar["title"];
    document.getElementById("month").value = myvar["month"];
    document.getElementById("day").value = myvar["day"];
    document.getElementById("year").value = myvar["year"];
    document.getElementById("entry_location").value = myvar["location"];
    document.getElementById("entry_body").value = myvar["body"];
    $("#select2field").select2("val", myvar["category_list"]);
  });
});