$(document).on "turbolinks:load", ->
    #$('input[type=radio]:not(:checked)')
    #$('input').not(':checked')
    #$('input[type=radio][name="[subscriptor_level]"]:not(:checked)').#not(':checked')
    $('.launch').on 'click', ->
        if checkRows('subscriptors') > 0 && checkRows('books') > 0
            idbooks = []
            $('.tblBHolder tbody tr').each ->
                idbooks.push($(this).find('td:first').text())
            idsub = $('.tblSHolder tbody tr:first').find('td:first').text()
            #alert $('#returnDate').val()
            $.ajax
                type:'POST'
                url:'/borrows'
                data:
                    borrows:idbooks,
                    account:idsub,
                    outDate: $('#outDate').val(),
                    returnDate: $('#returnDate').val()
                success: (data) ->
                    alert data
                error: (data) ->
                    alert data
        else
            alert 'Error para guardar debe contener un usuario y al menos un libro'
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
    $(document).on 'submit', 'form#commitSearchByTitle', (e) ->
        e.preventDefault()
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
                    if checkRows('books') < 3
                        $('.tblBHolder tbody').append($(this).clone())
                        $('.tblBHolder tbody tr:last').append('<td><a class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash rmsub"></span></a></td>')
                        $('.row-results').show()
                        $('.tblBHolder').removeClass('table-hover')
                        $('.tblBHolder').removeClass('table-striped')
                        $('.tblBHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
                        $(this).closest("tr").remove()
                        $('.tblBHolder tr td:last').on 'dblclick', ->
                            $(this).closest("tr").remove()
                    else
                        alert 'no se pueden agregar mas de 3 libros por Usuario' 
    $(document).on 'submit', 'form#commitSearchByISBN', (e) ->
        e.preventDefault()
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
                    if checkRows('books') < 3
                        $('.tblBHolder tbody').append($(this).clone())
                        $('.tblBHolder tbody tr:last').append('<td><a class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash rmsub"></span></a></td>')
                        $('.row-results').show()
                        $('.tblBHolder').removeClass('table-hover')
                        $('.tblBHolder').removeClass('table-striped')
                        $('.tblBHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
                        $(this).closest("tr").remove()
                        $('.tblBHolder tr td:last').on 'dblclick', ->
                            $(this).closest("tr").remove()
                    else
                        alert 'no se pueden agregar mas de 3 libros por Usuario'
    $(document).on 'submit', 'form#commitSearchByAutor', (e) ->
        e.preventDefault()
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
                    if checkRows('books') < 3
                        # al momento se checara si el usuario tiene otros prestamos ? o cuando se haga commit ?
                        $('.tblBHolder tbody').append($(this).clone())
                        $('.tblBHolder tbody tr:last').append('<td><a class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash rmsub"></span></a></td>')
                        $('.row-results').show()
                        $('.tblBHolder').removeClass('table-hover')
                        $('.tblBHolder').removeClass('table-striped')
                        $('.tblBHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
                        $(this).closest("tr").remove()
                        $('.tblBHolder tr td:last').on 'dblclick', ->
                            $(this).closest("tr").remove()
                    else
                        alert 'no se pueden agregar mas de 3 libros por Usuario'
    $(document).on 'submit', 'form#commitSearchBySubAcc', (e) ->
        e.preventDefault()
        $.ajax
            type:'GET'
            url:'/borrows/findByAcc'
            data:
                borrow:
                    account: $('#account').val()
            success: (data) ->
                $('#modal-window').html(data)
                $('#modal-window').modal('show')
                $('.tblSubscriptors').on 'dblclick', 'tr', ->
                    $('.tblSHolder tbody').append($(this).clone())
                    $('.tblSHolder tbody tr:last').append('<td><a class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash rmsub"></span></a></td>')
                    $('.row-results').show()
                    $('.tblSHolder').removeClass('table-hover')
                    $('.tblSHolder').removeClass('table-striped')
                    $('.tblSHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
                    $(this).closest("tr").remove()
                    $('.tblSHolder tr td:last').on 'dblclick', ->
                        $(this).closest("tr").remove()
            error: (data) ->
                alert 'El Numero de cuenta no fue encontrado'
    $(document).on 'submit', 'form#commitSearchByName', (e) ->
        e.preventDefault()
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
                    if checkRows('subscriptors') == 0
                        $('.tblSHolder tbody').append($(this).clone())
                        $('.tblSHolder tbody tr:last').append('<td><a class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash rmsub"></span></a></td>')
                        $('.row-results').show()
                        $('.tblSHolder').removeClass('table-hover')
                        $('.tblSHolder').removeClass('table-striped')
                        $('.tblSHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
                        $(this).closest("tr").remove()
                        $('.tblSHolder tr td:last').on 'dblclick', ->
                             $(this).closest("tr").remove()
                    else
                        alert 'solo se permite un usuario'
            error: (data) ->
                alert data
checkRows =(opt) ->
    if opt == 'subscriptors'
        return $('.tblSHolder tbody').children('tr').length;
    else
        return $('.tblBHolder tbody').children('tr').length;

# el siguiente codigo funciona pero se propara a todo por el submit , form afecta a todo el Rail Proyect    
    # $(document).on 'submit', 'form', (e) ->
    #   e.preventDefault()
    #   searchMethod = $(this).attr('id')
    #   switch searchMethod
    #         when 'commitSearchByTitle'
    #             $.ajax
    #                 type:'GET'
    #                 url:'/borrows/findByTitle'
    #                 data:
    #                     borrow:
    #                         title: $('#title').val()
    #                 success: (data) ->
    #                     $('#modal-window').html(data)
    #                     $('#modal-window').modal('show')
    #                     $('.tblBooks').on 'dblclick', 'tr', ->
    #                         $('.tblBHolder tbody').append($(this).clone())
    #                         $('.row-results').show()
    #                         $('.tblBHolder').removeClass('table-hover')
    #                         $('.tblBHolder').removeClass('table-striped')
    #                         $('.tblBHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
    #                         $(this).closest("tr").remove()
                            
    #                         #alert $(this).find('td:first').text()
    #                         #x = $(this).parent().parent().children().index($(this).parent()) #get row index
    #                         #y = $(this).parent().children().index($(this)) #get column index fixed to 0
    #                         #alert $(this).rows[x].cells[0].text()
    #                     # $('#book_holder').empty()
    #                     # $('#book_holder').append(data)
    #         when 'commitSearchByISBN'
    #             $.ajax
    #                 type:'GET'
    #                 url:'/borrows/findByISBN'
    #                 data:
    #                     borrow:
    #                         isbn: $('#isbn').val()
    #                 success: (data) ->
    #                     $('#modal-window').html(data)
    #                     $('#modal-window').modal('show')  
    #                     $('.tblBooks').on 'dblclick', 'tr', ->
    #                         $('.tblBHolder tbody').append($(this).clone())
    #                         $('.row-results').show()
    #                         $('.tblBHolder').removeClass('table-hover')
    #                         $('.tblBHolder').removeClass('table-striped')
    #                         $('.tblBHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
    #                         $(this).closest("tr").remove()
    #         when 'commitSearchByAutor'
    #             $.ajax
    #                 type:'GET'
    #                 url:'/borrows/findByAutor'
    #                 data:
    #                     borrow:
    #                         autor: $('#autor').val()
    #                 success: (data) ->
    #                     $('#modal-window').html(data)
    #                     $('#modal-window').modal('show')  
    #                     $('.tblBooks').on 'dblclick', 'tr', ->
    #                         $('.tblBHolder tbody').append($(this).clone())
    #                         $('.row-results').show()
    #                         $('.tblBHolder').removeClass('table-hover')
    #                         $('.tblBHolder').removeClass('table-striped')
    #                         $('.tblBHolder').find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
    #                         $(this).closest("tr").remove()
    #         when 'commitSearchByName'
    #             $.ajax
    #                 type:'GET'
    #                 url:'/borrows/findByName'
    #                 data:
    #                     borrow:
    #                         name: $('#name').val()
    #                 success: (data) ->
    #                     $('#modal-window').html(data)
    #                     $('#modal-window').modal('show')
    #                     $('.tblSubscriptors').on 'dblclick', 'tr', ->
    #                         alert $(this).find('td:first').text()
    #                     #$('#subs_holder').empty()
    #                     #$('#subs_holder').append(data)
    #         when 'commitSearchBySubAcc'
    #             $.ajax
    #                 type:'GET'
    #                 url:'/borrows/findByAcc'
    #                 data:
    #                     borrow:
    #                         account: $('#account').val()
    #                 success: (data) ->
    #                     $('#modal-window').html(data)
    #                     $('#modal-window').modal('show')
# comentada tienen distintas funciones pero no se usaron
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
 #alert $(this).find('td:first').text()
                        #$('#subs_holder').empty()
                        #$('#subs_holder').append(data)