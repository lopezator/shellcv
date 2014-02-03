setCursorBlink = ->
  window.setInterval (->
    if $("#cursor").css("visibility") is "visible"
      $("#cursor").css visibility: "hidden"
    else
      $("#cursor").css visibility: "visible"
  ), 300

#document.ready
$ ->
  cursor = setCursorBlink()
  $("#input").keyup ->
    $("#cmd span").text $(this).val()

  $("#main").mouseleave ->
    clearInterval cursor
    $("#cursor").css visibility: "visible"
    $("#cursor").attr "class", "cursor-outside"

  $("#main").mouseenter ->
    clearInterval cursor
    cursor = setCursorBlink()
    $("#cursor").attr "class", "cursor-inside"
