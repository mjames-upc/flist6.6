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
//= require bootstrap

//= require underscore
//= require gmaps/google
//= require jquery-tablesorter
//= require_tree .
//$(function() {
//  $("#franken_beers th a, #franken_beers .pagination a").on("click", function() {
//    $.getScript(this.href);
//    return false;
//  });
//  //$("#franken_beer_search input").keyup(function() {
//  //  $.get($("#franken_beer_search").attr("action"), $("#franken_beer_search").serialize(), null, "script");
//  //  console.log("keyup: " +$("#franken_beer_search"));
//  //  console.log("keyup: " +$("#franken_beer_search").attr("action"));
//  //  return false;
//  //});
///*  $("#franken_beer_search").submit(function() {
//    $.get(this.action, $(this).serialize(), null, "script");
//    //$.get($("#franken_beer_search").attr("action"), $("#franken_beer_search").serialize(), null, "script");
//    console.log($("#franken_beer_search"));
//    console.log($("#franken_beer_search").attr("action"));
//    console.log($(this));
//    //$("#FrankenBeer").html("<%= escape_javascript(render partial: '"'FrankenBeers/FrankenBeer", locals: {FrankenBeer: @FrankenBeer}) %>");
//    return false;
//  });*/
//});
function createSidebarLi(json){
    //console.log("building sidebar item for " + json.title);
    return ("<li><a>" + json.marker_title + "</a></li>");
};

function bindLiToMarker($li, marker){
    $li.on('click', function(){
        handler.getMap().setZoom(14);
        //marker.setMap(handler.getMap()); //because clusterer removes map property from marker
        marker.panTo();
        google.maps.event.trigger(marker.getServiceObject(), 'click');
    })
};

function createSidebar(markers){
    console.log(markers);
    _.each(markers, function(marker){
        console.log(marker);
        var $li = $( createSidebarLi(marker) );
        $li.appendTo('#sidebar_container');
        //
        bindLiToMarker($li, marker);
    });
};

$(document).ready(function($) {

    // Sorting and pagination links.
    $('#franken_beers th a, #franken_beers .pagination a').on('click', function () {
        $.getScript(this.href);
        return false;
    });

    // Search form.
    $('#franken_beers_search').submit(function () {
        console.log("submitting from application.js");
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });

    //$('.check_all').click(function () {
    //    console.log(this.checked);
    //    $('#tag_search').find(':checkbox').prop('checked', this.checked);
    //});

});

