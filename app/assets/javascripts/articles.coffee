# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "submit", ".new-comment-form-container form", (e)->
  e.preventDefault()
  $form = $(this)
  $form.ajaxSubmit(
    success: (data)->
      str = data
      $('.comments').append(str)
  )

  $form.find("input, textarea").val("")