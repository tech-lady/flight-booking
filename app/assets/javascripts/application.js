// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(){
  
  $("#origin-id").change(function(e){
    compareOriginDestination();
  });

  $("#destination-id").change(function(e){
    compareOriginDestination();
  });

  function compareOriginDestination() {
    origin = $("#origin-id").find(":selected").val();
    destination = $("#destination-id").find(":selected").val();

    if (origin == destination) {
      $("#search-flight").attr('disabled', true);
      $(".notice").css("display", "block")
    } else {
      $("#search-flight").attr('disabled', false);
      $(".notice").css("display", "none")
    }
  }

  $(".book-flight").on('mouseenter', function(){
    compareOriginDestination()
  });

  $(".book-flight").on('mouseleave', function(){
    $("#search-flight").attr('disabled', false);
    $(".notice").css("display", "none")
  });
});
