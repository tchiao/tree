$(document).ready(function(){
  $("#keyword-search").keyup(function(){
    $.get(this.action, $(this).serialize(), null, 'script');
  });

  $("#date-search").keyup(function(){
    $.get(this.action, $(this).serialize(), null, 'script');
  });

  $("a.date-search-link").click(function(e) {
    e.preventDefault();
    $("div.search-box").hide();
    $("div.date-search-section").show();
  });

  $("a.keyword-search-link").click(function(e) {
    e.preventDefault();
    $("div.search-box").show();
    $("div.date-search-section").hide();
  });
});