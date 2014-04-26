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

generateButtonText = (options, select ) ->
  console.log(select.context.options)
  if (options.length == 0)
    return "None" + ' <b class="caret"></b>'
  else if (options.length == select.context.options.length - 1)
    return "Everyone" + ' <b class="caret"></b>'
  else
    selected = [];
    options.each(() ->
      label = if ($(this).attr('label') != undefined) then $(this).attr('label') else $(this).html()

      selected.push label;
    )

    return selected.join(", ") + ' <b class="caret"></b>'

multiselectReady = () ->
  $('.multiselect').multiselect({
    includeSelectAllOption:true,
    selectAllText: "Everyone",
    selectAllValue:"multiselect-all",
    onChange: costMultiselectChange,
    buttonText : generateButtonText
  });

$(document).ready(multiselectReady)
$(document).on('page:load', multiselectReady)