$(document).on "turbolinks:load", ->
    setUp()
    getReturnDay()
    $("label[for='returnDate']").on 'dblclick', ->
       $('input#returnDate').attr('disabled',false)
    $('.launch').on 'click', ->
        if checkRows('subscriptors') > 0 && checkRows('books') > 0
            idbooks = []
            $('.tblBHolder tbody tr').each ->
                idbooks.push($(this).find('td:first').text())
            idsub = $('.tblSHolder tbody tr:first td:eq(1)').text()
            $.ajax
                type:'POST'
                url:'/borrows'
                #dataType:'json'
                data:
                    borrows:idbooks,
                    account:idsub,
                    outDate: $('#outDate').val(),
                    returnDate: $('#returnDate').val()
                success: (data) ->
                    $('#modal-window').html(data)
                    $('#modal-window').modal('show')
                    $('.tblBorrowedBooks tbody tr').each ->
                        $i = $(this).find('td:first').text()
                        $(".tblBHolder tbody tr td:contains('"+$i+"')").closest("tr").remove()
                    $('.tblSHolder tbody tr').remove()
                    $('.tblBHolder tbody tr').remove()
                    setUp()
                    clearFrm()
                    #$('.modal-body p#latestSaved').hide()
                    #$indx = $.trim($('p').text())
                    #$(".tblBHolder tbody tr td:contains('"+$indx+"')").closest("tr").remove()
                    #console.log $('p').text()
                    #alert $('p').text()
                    # if data.errors
                    #     alert data.errors
                error: (data) ->
                    console.log data.errors
        else
            alert 'Error para guardar debe contener un usuario y al menos un libro'
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
                $('.tblSHolder tbody tr:last').remove()
                cryteriaEnabler()
            error: (data) ->
                alert 'errore encontrados' + data
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
    $(document).on 'submit', 'form#commitSearchByTitle',  (e) ->
        e.preventDefault()
        unless emptyInput($('#title'))
            mySpin('s')
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
                    mySpin('f')
                error:  (data) ->
                    console.log data
                    mySpin('f')
                    alert 'El Numero de cuenta no fue encontrado'
    $(document).on 'submit', 'form#commitSearchByISBN',   (e) ->
        e.preventDefault()
        unless emptyInput($('#isbn'))
            mySpin('s')
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
                    mySpin('f')
                error:  (data) ->
                    console.log data
                    mySpin('f')
                    alert 'Datos no encontrados'
    $(document).on 'submit', 'form#commitSearchByAutor',  (e) ->
        e.preventDefault()
        unless emptyInput($('#autor'))
            mySpin('s')
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
                    mySpin('f')
                error:  (data) ->
                    console.log data
                    mySpin('f')
                    alert 'Datos no encontrados'
    $(document).on 'submit', 'form#commitSearchBySubAcc', (e) ->
        e.preventDefault()
        unless emptyInput($('#account'))
            mySpin('s')
            $.ajax
                type:'GET'
                url:'/borrows/findByAcc'
                data:
                    borrow:
                        account: $('#acct').val()
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
                            cryteriaEnabler()
                        cryteriaEnabler()
                    mySpin('f')
                error:  (data) ->
                    console.log data
                    mySpin('f')
                    alert 'El Numero de cuenta no fue encontrado'
    $(document).on 'submit', 'form#commitSearchByName',   (e) ->
        e.preventDefault()
        unless emptyInput($('#name'))
            mySpin('s')
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
                                 cryteriaEnabler()
                        else
                            alert 'solo se permite un usuario'
                        cryteriaEnabler()
                    mySpin('f')
                error:  (data) ->
                    console.log data
                    mySpin('f')
                    alert 'la busqueda por nombre: ' + $('#name').val() + ' no arrojo resutados'

checkRows =(opt) ->
    if opt == 'subscriptors'
        return $('.tblSHolder tbody').children('tr').length;
    else
        return $('.tblBHolder tbody').children('tr').length;
getReturnDay=->
    d = new Date()
    rday = d.getDate()+5
    rmonth = d.getMonth()+1
    ryear = d.getFullYear()
    rdate = new Date(rmonth+'/'+rday+'/'+ryear)
    dayNames= ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']
    if dayNames[rdate.getDay()]=='Sábado'
        rday = rday + 2
        rdate = new Date(rmonth+'/'+rday+'/'+ryear)
    if dayNames[rdate.getDay()]=='Domingo'
        rday = rday + 1
        rdate = new Date(rmonth+'/'+rday+'/'+ryear)
    $('input#outDate').attr('disabled',true)
    $('input#returnDate').attr('disabled',true)
    $('input#outDate').val($.datepicker.formatDate('dd/mm/yy ', new Date()))
    $('input#returnDate').val($.datepicker.formatDate('dd/mm/yy ', rdate))
    #$('input#returnDate').val($.datepicker.formatDate('dd/mm/yy ', new Date()))
    #alert dayNames[d.getDay()]
mySpin=(opt) ->
    if opt == 's'
        $('#spinnerContainer').spin#('small','purple')
             lines: 9
             length: 7
             width: 8
             radius: 6
             color: 'purple'
            # speed: 1
             trail: 60
             shadow: true
    else
         $('#spinnerContainer').spin false
setUp= ->
    $('input[type=radio][name="[cryteria_level]"]').attr('disabled',true)
    $('.row-results').hide()
    $('input[type=radio][name="[subscriptor_level]"]').attr('checked',false)
    $('input[type=radio][name="[cryteria_level]"]').attr('checked',false)
cryteriaEnabler=->
    if checkRows('subscriptors') == 0
        $('input[type=radio][name="[cryteria_level]"]').attr('disabled',true)
        $('#search_left_holder :input').attr('disabled',true)
    else
        if $('.tblSHolder tbody tr td:first').text() == '3'
            alert 'el usuario ha llegado a su limite de rentas'
            $('input[type=radio][name="[cryteria_level]"]').attr('disabled',true)
            $('#search_left_holder :input').attr('disabled',true)
        else
            $('input[type=radio][name="[cryteria_level]"]').attr('disabled',false)
            $('#search_left_holder :input').attr('disabled',false)
readRents=->
    return parseInt($('.tblSHolder tbody tr:first td:first').text())
clearFrm=->
    $('#name').val('')
    $('#isbn').val('')
    $('#title').val('')
    $('#autor').val('')
    $('#account').val('')
emptyInput=($e)->
    if $e.val() == ''
        alert 'debe proporcionar un dato [ ' + $e.attr('name') + ' ]'
        return true
    else
        return false
    
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
    #$('input[type=radio]:not(:checked)')
    #$('input').not(':checked')
    #$('input[type=radio][name="[subscriptor_level]"]:not(:checked)').#not(':checked')