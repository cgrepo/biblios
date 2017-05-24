$(document).on "turbolinks:load", ->
    $('input[type=radio][name="[subscriptor_level]"]').change ->
        op = $('input[type=radio][name="[subscriptor_level]"]:checked').val()
        if op == '0'
            url='/borrows/getSubscriptorAcc'
        else
            url='/borrows/getSubscriptorName'
        $.ajax
            type:'GET'
            url:url
            success: (data) ->
                $('#data_holder').empty()
                $('#data_holder').append(data)

    
    $('input[type=radio][name="[cryteria_level]"]').change ->
        op = $('input[type=radio][name="[cryteria_level]"]:checked').val()
        switch op
                when '0' 
                    url = '/borrows/getByTitle'
                when '1' 
                    url = '/borrows/getByISBN'
                when '2' 
                    url = '/borrows/getByAutor'
        $.ajax
            type:'GET'
            url:url
            success: (data) ->
                $('#search_holder').empty()
                $('#search_holder').append(data)

    
$(document).on 'submit', 'form#commitSearchByTitle', (e) ->
  e.preventDefault()
  alert
  $.ajax
    type:'GET'
    url:'/borrows/findByTitle'
    data:
        title: $('#title').val()
    success: (data) ->
        $('#data_holder').empty()
        $('#data_holder').append(data)
return