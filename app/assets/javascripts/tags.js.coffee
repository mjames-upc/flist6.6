jQuery ->
  # Ajax sorting and pagination on click
  $('#search td.sortable a, #search .pagination a').on('click', ->
    $.getScript(this.href)
    false
  )
  # Ajax search on submit
  $('#franken_beer_search').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    false
  )
  # Ajax search on keyup
  $('#franken_beer_search').keyup( ->
    $.get($("#franken_beer_search").attr("action"), $("#franken_beer_search").serialize(), null, 'script')
    false
  )
