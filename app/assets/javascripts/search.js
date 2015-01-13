$(document).ready(function(){
  $("#keyword-search").keyup(function(){
    $("#timeline-embed").html("")

    createStoryJS({
      type:       'timeline',
      width:      '100%',
      height:     '600',
      source:     "/entries.json?" + $(this).serialize(),
      embed_id:   'timeline-embed',
      css:        '/assets/timeline-new.css',
      js:         'https://s3.amazonaws.com/cdn.knightlab.com/libs/timeline/latest/js/timeline.js'
    });
  });

  $("#date-search").keyup(function(){
    $("#timeline-embed").html("")

    createStoryJS({
      type:       'timeline',
      width:      '100%',
      height:     '600',
      source:     "/entries.json?" + $(this).serialize(),
      embed_id:   'timeline-embed',
      css:        '/assets/timeline-new.css',
      js:         'https://s3.amazonaws.com/cdn.knightlab.com/libs/timeline/latest/js/timeline.js'
    });
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