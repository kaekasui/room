# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  add_count = 0
  $("td.add_status").click ->
    add_count += 1
    $("table.table").append(
      "<tr>
        <td><input type='checkbox' name='status[new][#{add_count}][finished]'></td>
        <td><input type='text' name='status[new][#{add_count}][name]'></td>
      </tr>"
    )
