// $("#entry_url").bind('input', function(){
//   input_url = $('#entry_url').val()
//   httpGet(input_url);
// });

var myvar;

$("#scrape-button").click(function(){
  $.post("/scraper", { url: $("#entry_url").val()}, function(data){
    console.log(data);
    myvar = data;
  });
});


// Implement a button that when clicked hits your server with a url paramter
// On the server side, you should then follow that url and run your parsing algorithm on it
// Once you have parsed whatever you want out of the site
// return it to the callback method and log that data to console!


