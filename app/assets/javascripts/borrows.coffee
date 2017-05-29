$(document).on "turbolinks:load", ->
    #$('input[type=radio]:not(:checked)')
    #$('input').not(':checked')
    #$('input[type=radio][name="[subscriptor_level]"]:not(:checked)').#not(':checked')
    $('.row-results').hide()
    $('input[type=radio][name="[subscriptor_level]"]').attr('checked',false)
    $('input[type=radio][name="[cryteria_level]"]').attr('checked',false)
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
                        borrow:
                            title: $('#title').val()
                    success: (data) ->
                        $('#modal-window').html(data)
                        $('#modal-window').modal('show')
                        $('.tblBooks').on 'dblclick', 'tr', ->
                            $('.tblBHolder tbody').append($(this).clone())
                            $('.row-results').show()
                            $('.tblBHolder').removeClass('table-hover')
                            $('.tblBHolder').removeClass('table-striped')
                            $('.tblBHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
                            #$(this).closest("tr").remove()
                            
                            #alert $(this).find('td:first').text()
                            #x = $(this).parent().parent().children().index($(this).parent()) #get row index
                            #y = $(this).parent().children().index($(this)) #get column index fixed to 0
                            #alert $(this).rows[x].cells[0].text()
                        # $('#book_holder').empty()
                        # $('#book_holder').append(data)
            when 'commitSearchByName'
                $.ajax
                    type:'GET'
                    url:'/borrows/findByName'
                    data:
                        borrow:
                            name: $('#name').val()
                    success: (data) ->
                        $('#modal-window').html(data)
                        $('#modal-window').modal('show')
                        $('.tblSubscriptors').on 'dblclick', 'tr', ->
                            alert $(this).find('td:first').text()
                        #$('#subs_holder').empty()
                        #$('#subs_holder').append(data)
            when 'commitSearchBySubAcc'
                $.ajax
                    type:'GET'
                    url:'/borrows/findByAcc'
                    data:
                        borrow:
                            account: $('#account').val()
                    success: (data) ->
                        $('#modal-window').html(data)
                        $('#modal-window').modal('show')
            when 'commitSearchByISBN'
                $.ajax
                    type:'GET'
                    url:'/borrows/findByISBN'
                    data:
                        borrow:
                            isbn: $('#isbn').val()
                    success: (data) ->
                        $('#modal-window').html(data)
                        $('#modal-window').modal('show')  
                        $('.tblBooks').on 'dblclick', 'tr', ->
                            alert $(this).find('td:first').text()
            when 'commitSearchByAutor'
                $.ajax
                    type:'GET'
                    url:'/borrows/findByAutor'
                    data:
                        borrow:
                            autor: $('#autor').val()
                    success: (data) ->
                        $('#modal-window').html(data)
                        $('#modal-window').modal('show')  
                        $('.tblBooks').on 'dblclick', 'tr', ->
                            alert $(this).find('td:first').text()            
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
