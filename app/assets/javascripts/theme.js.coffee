if @up
  up.motion.defaults
    duration: 500
  
  up.awaken '.side--item', batch: true, ($fragment) ->
    $side = $('.side')
    fromTopEdge = $fragment.first().position().top
    currentScrollTop = $side.scrollTop()
    $('.side').animate({ scrollTop: fromTopEdge + currentScrollTop }, 400)
