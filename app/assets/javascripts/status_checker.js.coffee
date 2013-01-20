$ ->
  $('#spinner').each ->
    setInterval(
      =>
        $.get $(@).attr('url'), (status) ->
          if status == 'ready'
            setTimeout 'window.location.reload()', 20000
      ,
      10000)
