$ ->
  $('#spinner').each ->
    setInterval(
      =>
        $.get $(@).attr('url'), (status) ->
          if status == 'ready'
            setTimeout 'window.location.reload()', 7000
      ,
      10000)
