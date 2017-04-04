$(document).on "turbolinks:load", ->
    $('#profile').hide()
    $('.octicon').click ->
        $('#profile').fadeToggle()