$ ->
  $('#spinner').each ->
    setInterval(
      =>
        $.get $(@).attr('url'), (data) ->
          if data.status == 'ready'
            setTimeout 'window.location.reload()', 20000
          if data.status == 'failed'
            window.location.href = "/?errorId=#{data.id}"
      ,
      10000)
