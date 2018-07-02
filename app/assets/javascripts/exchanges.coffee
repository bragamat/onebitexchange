# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $('form').submit (event) ->
    event.preventDefault()
    if $("#theImg").val() == true
      console.log('ja existe')
    else
    $('#double_arrow').append('<img id="theImg" src="http://blog.teamtreehouse.com/wp-content/uploads/2015/05/loading.gif" />')
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#theImg').remove()
            $('#result').val(data.value)
        return false;
  $ ->
    $('input#amount').on "input", ->
     $('form').submit()
  $ -> 
    $('a#double_arrow').click (event)->
      event.preventDefault()
      a = $("#source_currency").val()
      $("#source_currency").val($("#target_currency").val())
      $("#target_currency").val(a)
  
