$(document).on "turbolinks:load", ->
    $table = $('.tblCard')
    $table.removeClass('table-hover')
    $table.removeClass('table-striped')
    # $table.find('thead th').css('color':'black')
    # $table.find('thead th').css('background-color':'red')
    $table.find('thead th').css('background-color':'rgba(0, 0, 0, 0.5)')
    $table.find('thead tr th').css('align':'center')
    $table.find('tbody tr td').css('align':'center')
    $table.on 'dblclick', 'td', ->
        alert $(this).text()
    