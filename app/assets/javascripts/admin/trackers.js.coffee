# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('page:change', (e) ->
  add_count = 0
  $(".add_tracker").click ->
    add_count += 1
    $("table.table").append(
      "<tr>
        <td><input type='text' name='tracker[new][#{add_count}][name]' class='form-control'></td>
      </tr>"
    ))
