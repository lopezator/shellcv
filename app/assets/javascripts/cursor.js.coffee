setCursorBlink = ->
  window.setInterval (->
    if $("#cursor").css("visibility") is "visible"
      $("#cursor").css visibility: "hidden"
    else
      $("#cursor").css visibility: "visible"
  ), 300

#document.ready
$ ->
  $("#input").focus().val "";
  cursor = setCursorBlink()

  $("#main").click ->
    $("#input").focus();

  $("#input").on "input", ->
    $("#cursor").css visibility: "visible"
    $("#cmd span").text @value

  $("#main").mouseleave ->
    clearInterval cursor
    $("#input").blur()
    $("#cursor").css visibility: "visible"
    $("#cursor").attr "class", "cursor-outside"

  $("#main").mouseenter ->
    clearInterval cursor
    $("#input").focus()
    cursor = setCursorBlink()
    $("#cursor").attr "class", "cursor-inside"
