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
      $(global).unbind();
      $("#timeline-embed").html("")

      createStoryJS({
        type:             'timeline',
        width:            '100%',
        height:           '575',
        source:           "/entries.json?" + $("#keyword-search").serialize(),
        embed_id:         'timeline-embed',
        css:              '/assets/timeline-new.css',
        js:               '/timeline-min.js'
      });
      
    }, 250 );
  });

  $("#date-search").keyup(function(){
    delay(function(){
      $(global).unbind();
      $("#timeline-embed").html("")

      createStoryJS({
        type:             'timeline',
        width:            '100%',
        height:           '575',
        source:           "/entries.json?" + $("#date-search").serialize(),
        embed_id:         'timeline-embed',
        css:              '/assets/timeline-new.css',
        js:               '/timeline-min.js'
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
