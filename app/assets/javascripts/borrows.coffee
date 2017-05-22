$(document).on "turbolinks:load", ->
    $('input[type=radio][name="[cryteria_level]"]').change ->
        op = $('input[type=radio][name="[cryteria_level]"]:checked').val()
        if op == '0'
            url = '/borrows/getByTitle'
        if op == '1'
            url = '/borrows/getByISBN'
        else
            url = '/borrows/getByAutor'
        
        $.ajax
            type:'GET'
            url:url
            success: (data) ->
                $('#holder').empty()
                $('#holder').append(data)
            