$(document).ready(function(){
  var delay = (function(){
    var timer = 0;
    return function(callback, ms){
      clearTimeout (timer);
      timer = setTimeout(callback, ms);
    };
  })();

  $("#keyword-search").keyup(function(){
    delay(function(){
      $("#timeline-embed").html("")
      
      createStoryJS({
        type:       'timeline',
        width:      '100%',
        height:     '600',
        source:     "/entries.json?" + $("#keyword-search").serialize(),
        embed_id:   'timeline-embed',
        css:        '/assets/timeline-new.css',
        js:         'https://s3.amazonaws.com/cdn.knightlab.com/libs/timeline/latest/js/timeline.js'
      });
    }, 250 );
  });

  $("#date-search").keyup(function(){
    delay(function(){
      $("#timeline-embed").html("")
      
      createStoryJS({
        type:       'timeline',
        width:      '100%',
        height:     '600',
        source:     "/entries.json?" + $("#date-search").serialize(),
        embed_id:   'timeline-embed',
        css:        '/assets/timeline-new.css',
        js:         'https://s3.amazonaws.com/cdn.knightlab.com/libs/timeline/latest/js/timeline.js'
      });
    }, 500 );

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