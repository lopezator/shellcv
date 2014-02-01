# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Local variables
blue = "#4a90d9"
grey =  "#9b9d9e"
darkGrey = "#828586"

$ ->  #document.ready
  #scroll
  $("#content").niceScroll(
    autohidemode: false,
    cursorborder: "none",
    cursorwidth: "7px",
    cursorborderradius: 5,
    cursorcolor: grey
  )

  #Initialization & events
  scroll = $("#ascrail2000").children(0)
  hoverBind(scroll)

  scroll.mousedown ->
    changeBackgroundColor scroll, blue
    hoverUnbind scroll

  scroll.mouseup ->
    changeBackgroundColor scroll, grey
    hoverBind scroll

  scroll.mouseleave ->
    changeBackgroundColor scroll, grey
#document.ready end

#Functions
changeBackgroundColor = (element, color) ->
  element.css "background-color", color

hoverBind = (element) ->
  element.mouseenter ->
    changeBackgroundColor element, darkGrey
  element.mouseleave ->
    changeBackgroundColor element, grey

hoverUnbind = (element) ->
  element.unbind "mouseenter mouseleave"
#Functions end