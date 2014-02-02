# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('page:change', (e) ->
  $(".condition-toggle").click ->
    $(".condition-case").toggle()

  $(".condition-case select").change ->
    set_condition()

  $(".condition-case [type='checkbox']").change ->
    set_condition()
)

set_condition = ->
  condition = {}
  $('[type="checkbox"]:checked').each ->
    condition[this.id] = $('select#' + this.id).val()
  $.ajax({
    url: "tickets/set_tickets",
    type: "POST",
    data: condition,
    success: (response) ->
    error: (response) -> alert("エラーが発生しました")
  })
