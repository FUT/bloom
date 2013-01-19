$ ->
  checkStatus = (url) =>
    $.get url, (data) =>
      $('#spinner').after(data.video).remove() if data.video

  $('#spinner').each ->
    setInterval(
      ->
        checkStatus($(@).attr('url'))
      ,
      5000)
