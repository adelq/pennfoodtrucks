# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$.fn.stars = ->
  $(this).each ->
    # Get the value
    val = parseFloat($(this).html())
    val = Math.round(val * 2) / 2; # To round to nearest half
    # Make sure that the value is in 0 - 5 range, multiply to get width
    size = Math.max(0, Math.min(5, val)) * 16
    # Create stars holder
    $span = $('<span />').width(size)
    # Replace the numerical value with stars
    $(this).html $span

document.addEventListener 'turbolinks:load', ->
  $('span.stars').stars()
