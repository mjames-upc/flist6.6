jQuery ->
  $('.check_all').on('click', ->
    $('#franken_beers').find(':checkbox').prop('checked', this.checked)
  )

#  # Ajax sorting and pagination on click
#  $('#franken_beers td.sortable a, #franken_beers .pagination a').on('click', ->
#    $.getScript(this.href)
#    false
#  )
#  # Ajax search on submit
#  $('#franken_beer_search').submit( ->
#    $.get(this.action, $(this).serialize(), null, 'script')
#    console.log("submitting from tags.js.coffee")
#    false
#  )
#  # Ajax search on keyup
#  $('#franken_beer_search').keyup( ->
#    $.get($("#franken_beer_search").attr("action"), $("#franken_beer_search").serialize(), null, 'script')
#    false
#  )

