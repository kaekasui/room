# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  add_count = 0
  $("td.add_version").click ->
    add_count += 1
    $("table.table").append(
      "<tr>
      <td><input type='radio' name='version[current]' value='new_#{add_count}'></td>
      <td><input type='text' name='version[new][#{add_count}]'></td>
      </tr>"
    )
