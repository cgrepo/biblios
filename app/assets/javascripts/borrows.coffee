$(document).on "turbolinks:load", ->

    $('input[type=radio][name="[subscriptor_level]"]').change ->
        op = $('input[type=radio][name="[subscriptor_level]"]:checked').val()
        if op == '0'
            url='/borrows/getByAcc'
        else
            url='/borrows/getByName'
        $.ajax
            type:'GET'
            url:url
            success: (data) ->
                $('#search_rigth_holder').empty()
                $('#search_rigth_holder').append(data)
    
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
                $('#search_left_holder').empty()
                $('#search_left_holder').append(data)


    $(document).on 'submit', 'form', (e) ->
       e.preventDefault()
       searchMethod = $(this).attr('id')
       switch searchMethod
            when 'commitSearchByTitle'
                $.ajax
                    type:'GET'
                    url:'/borrows/findByTitle'
                    data:
                        title: $('#title').val()
                    success: (data) ->
                        $('#modal-window').html(data)
                        $('#modal-window').modal('show')
                        $('.tblBooks').on 'dblclick', 'td', ->
                            alert $(this).text()
                        # $('#book_holder').empty()
                        # $('#book_holder').append(data)
                        
                        
        
            when 'commitSearchByName'
                $.ajax
                    type:'GET'
                    url:'/borrows/findByName'
                    data:
                        name: $('#name').val()
                    success: (data) ->
                        $('#subs_holder').empty()
                        $('#subs_holder').append(data)
                        $('.tblSubscriptors').on 'dblclick', 'td', ->
                            alert $(this).text()
    
# $('#tblSubscriptors').on 'dblclick', 'td', ->
#     alert $(this).text()
#  $(document).on 'submit', 'form#commitSearchByTitle', (e) ->
#   e.preventDefault()
#   alert
#   $.ajax
#     type:'GET'
#     url:'/borrows/findByTitle'
#     data:
#         title: $('#title').val()
#     success: (data) ->
#         $('#book_holder').empty()
#         $('#book_holder').append(data)
# return

# $(document).on 'submit', 'form#commitSearchByName', (e) ->
#   e.preventDefault()
#   alert
#   $.ajax
#     type:'GET'
#     url:'/borrows/findByName'
#     data:
#         title: $('#name').val()
#     success: (data) ->
#         $('#subs_holder').empty()
#         $('#subs_holder').append(data)
# return
