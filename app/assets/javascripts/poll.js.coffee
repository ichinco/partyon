# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
pollReady = () ->
  $(".add-choice").click( ->
    $('.choice.hidden').first().removeClass("hidden")
    false
  )
  $(".add-choice").removeClass("hidden")
  $('.choice').addClass("hidden")
  $('.choice.hidden').first().removeClass("hidden")
  $('.choice.hidden').first().removeClass("hidden")
  $('.choice.hidden').first().removeClass("hidden")
  $('.choice.hidden').first().removeClass("hidden")
  $('.choice.hidden').first().removeClass("hidden")

$(document).ready(pollReady)
$(document).on('page:load', pollReady);