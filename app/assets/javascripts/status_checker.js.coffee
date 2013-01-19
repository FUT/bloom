$ ->
  $('#spinner').each ->
    setInterval(
      =>
        $.get $(@).attr('url'), (status) ->
          window.location.reload() if status == 'ready'
      ,
      5000)
