# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

scheduleReady = () ->
  $('.timepicker').timepicker({
      template: false,
      showInputs: false,
      minuteStep: 5
  })

$(document).ready(scheduleReady)
$(document).on('page:load', scheduleReady);
