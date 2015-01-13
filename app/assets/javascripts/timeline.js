$(document).ready(function() {
  createStoryJS({
    type:       'timeline',
    width:      '100%',
    height:     '600',
    source:     "/entries.json",
    embed_id:   'timeline-embed',
    css:        '/assets/timeline-new.css',
    js:         'https://s3.amazonaws.com/cdn.knightlab.com/libs/timeline/latest/js/timeline.js'
  });
});
