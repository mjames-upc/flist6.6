$(document).ready ->
  $ ->
    $.extend $.tablesorter.defaults,
      widgets: [
        "zebra"
        "columns"
      ]

    $("#beer_table").tablesorter( headers: { 0: { sorter: true}, 1: {sorter: false}, 2: {sorter: true} }, sortInitialOrder: 'desc' )
    $("#brewery_table").tablesorter( sortInitialOrder: 'desc' )

    return
