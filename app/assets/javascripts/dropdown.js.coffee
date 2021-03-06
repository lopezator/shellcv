$ ->  #document.ready
    $(".nav li a").each ->
        $(this).addClass "parent"  if $(this).next().length > 0

    $(".toggleMenu").click (e) ->
        e.preventDefault()
        $(this).toggleClass "active"
        $(".nav").toggle()

  #adjustMenu()

$(window).bind "resize orientationchange", ->
    ww = document.body.clientWidth
    #adjustMenu()

###
  adjustMenu = ->
    ww = document.body.clientWidth

    if ww < 768
        $(".toggleMenu").css "display", "inline-block"
        unless $(".toggleMenu").hasClass("active")
            $(".nav").hide()
        else
            $(".nav").show()

        $(".nav li").unbind "mouseenter mouseleave"
        $(".nav li a.parent").unbind("click").bind "click", (e) ->

            # must be attached to anchor element to prevent bubbling
            e.preventDefault()
            $(this).parent("li").toggleClass "hover"

    else if ww >= 768
      $(".toggleMenu").css "display", "none"
      $(".nav").show()
      $(".nav li").removeClass "hover"
      $(".nav li a").unbind "click"
      $(".nav li").unbind("mouseenter mouseleave").bind "mouseenter mouseleave", ->

        # must be attached to li so that mouseleave is not triggered when hover over submenu
        $(this).toggleClass "hover"
###