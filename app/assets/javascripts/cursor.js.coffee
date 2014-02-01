$ ->
  cursor = undefined

  $("#main").click ->
    $("input").focus()
    if(cursor == null)
      cursor = window.setInterval(->
        if $("#cursor").css("visibility") is "visible"
          $("#cursor").css visibility: "hidden"
        else
          $("#cursor").css visibility: "visible"
      , 300)

  $("input").keyup ->
    $("#cmd span").text $(this).val()

  $("#main").mousedown ->
    isMouseBeingClicked = true;

  $("#main").mouseup ->
    isMouseBeingClicked = false;
    clearInterval cursor
    cursor = null

  $("input").blur ->
    clearInterval cursor
    $("#cursor").css visibility: "visible"
    $("#cursor-inside").css visibility: "visible"

  $("input").focus ->
    $("#cursor-inside").css visibility: "hidden"