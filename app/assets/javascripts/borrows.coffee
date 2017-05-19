$(document).on "turbolinks:load", ->
    $('input[type=radio][name="[cryteria_level]"]').change ->
        op = $('input[type=radio][name="[cryteria_level]"]:checked').val()
        if op == '0'
            $.ajax
                type:'GET'
                url:'/borrows/getByTitle'
                success: (data) ->
                    #alert data
                    $('#holder').append(data)
    #     # if op == 1
    #     #     alert 'render search by ISBN'
    #     # else
    #     #     alert 'render search by Autor'
            