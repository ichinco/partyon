# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

multiselectReady = () ->
  $('.multiselect').multiselect({
    includeSelectAllOption:true,
    selectAllText: "Everyone",
    selectAllValue:"multiselect-all"

  });

$(document).ready(multiselectReady)
$(document).on('page:load', multiselectReady)