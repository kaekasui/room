# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('page:change', (e) ->
  add_count = 0
  $(".add_blog_link").click ->
    add_count += 1
    $("table.table").append(
      "<tr>
        <td><input type='text' name='blog_link[new][#{add_count}][title]' class='form-control'></td>
        <td><input type='text' name='blog_link[new][#{add_count}][url]' class='form-control'></td>
      </tr>"
    ))
