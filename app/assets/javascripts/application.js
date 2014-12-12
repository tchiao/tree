// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap


$(document).ready(function(){
  setTimeout(function(){
    $('#flash-container').slideUp();
  }, 1500);

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

