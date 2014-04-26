# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

costMultiselectChange = (element, checked) ->
  $.ajax({
    url:element.parent().data("url"),
    method:"post",
    data:{
      "user_id" : element.val(),
      "owes" : checked
    }
  })

multiselectReady = () ->
  $('.multiselect').multiselect({
    includeSelectAllOption:true,
    selectAllText: "Everyone",
    selectAllValue:"multiselect-all"
    onChange: costMultiselectChange
  });

$(document).ready(multiselectReady)
$(document).on('page:load', multiselectReady)