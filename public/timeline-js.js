$(document).ready(function() {
  createStoryJS({
    type:             'timeline',
    width:            '100%',
    height:           '575',
    source:           "/entries.json?" + $("#keyword-search").serialize(),
    embed_id:         'timeline-embed',
    css:              '/assets/timeline-new.css',
    js:               '/timeline-min.js'
  });
});
