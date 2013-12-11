# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $hideslide = $(".hideslide")
  $hideslide.on "click", (e) ->
    $link = $(this)
    $link.closest(".slide_fields").hide() 
    $link.prev("input[type=hidden]").val "1"



  toSliderItem = ($targetItem) ->
    if $targetItem.length
      newPosition = $targetItem.position().left
      $targetItem.addClass "slider-item-active"
      $targetItem.siblings().removeClass "slider-item-active"
      $(".slider").animate left: -newPosition
  totalWidth = 0
  $(".slider-item").each ->
    totalWidth = totalWidth + $(this).outerWidth()

  maxScrollPosition = totalWidth - $(".slider-wrapper").outerWidth()
  $("p").append totalWidth
  $(".slider").width totalWidth
  $(".slider-item:first").addClass "slider-item-active"
  


  $("a.slider-controls-prev").click ->
    $targetItem = $(".slider-item-active").prev()
    toSliderItem $targetItem

  $("a.slider-controls-next").click ->
    $targetItem = $(".slider-item-active").next()
    toSliderItem $targetItem 
