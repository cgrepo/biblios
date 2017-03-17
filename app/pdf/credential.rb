class Credential < Prawn::Document
    def initialize(subscriptor)
        super(page_size:[288,432], left_margins:10)
        #stroke_axis(negative_axes_length:40)
        x=-20
    #-----------FIRST BOX--------------------------------------------------------------------
        bounding_box([5+x, 325], :width => 260, :height => 155) do
            transparent(1) {stroke_bounds}
        end
        # bounding_box([275, 325], :width => 260, :height => 155) do
        #     transparent(1) {stroke_bounds}
        # end
        text_box("""Se acredita al lector para:
            * Obtener en préstamo a domicilia hasta tres libros
              simultáneamente durante una semana.
            * Renovar el préstamo siempre que otra persona no lo
              haya solicitado.
            * Apartar libros que se encuentren prestados.
            El lector se obliga a:
            * Conservar en buen estado los materiales de la biblioteca
            * Devolver los libros prestados a domicilio en la fecha
              indicada""", at:[-145+x,178], size:8, width:200, height:200, rotate_around: :upper_right, rotate: 180)
        text_box("""Firma del lector                        Firma del encargado de la biblioteca""", 
            at:[-25+x,340], size:8,  width:280, height:40, rotate_around: :center, rotate: 180 )
    #-----------SECOND BOX-------------------------------------------------------------------
        bounding_box([5+x, 160], :width => 260, :height => 155) do
            move_down 10
            font_size(9) {text "RED NACIONAL DE BIBLIOTECAS PUBLICAS", align: :center}
            font_size(8) { text "SERVICIO DE PRESTAMO A DOMICILIO", align: :center}
            transparent(1) {stroke_bounds}
            #text "Biblioteca No. ###"
            #text "Lector:#{subscriptor.fullname}"
            #text "Domicilio:#{subscriptor.address}"
            #text "Fecha de Vencimiento: #{subscriptor.vigencyEnd}"
    	    #stroke_axis
        end
        #stroke_axis(:at => [5,680], :height => 200, :color => 'FF0000')
        text_box("Biblioteca No. 345", at:[175+x,110], size:8)
        text_box("Lector: #{subscriptor.fullname}", at:[105+x,89], size:8)
        #stroke_rectangle [120,449], 155,30
        text_box("Domicilio: #{subscriptor.address}", at:[105+x,70], size:8, width:155, height:30 )
        text_box("Fecha de vencimiento: #{subscriptor.vigencyStart}", at:[105+x,25], size:8)
    #-----------SHAPES-----------------------------------------------------------------------
        stroke do
            self.line_width = 0.5
            horizontal_line 10+x,255+x, at:130
            horizontal_line 10+x,255+x, at:125
            
            horizontal_line 225+x,255+x, at:103
            horizontal_line 135+x,255+x, at:80
            horizontal_line 143+x,255+x, at:63
            horizontal_line 105+x,255+x, at:55
            horizontal_line 105+x,255+x, at:47
            horizontal_line 184+x,255+x, at:17
            
            rectangle [20+x,110], 70,90
            image subscriptor.picture.file.path, width:70, height:90, at:[20+x,110]
            #picture = subscriptor.picture.file.path
            #image picture, at: [25,500]
    	end
    	#dash([1, 2, 3, 4, 5, 6, 7, 8])
        #stroke_horizontal_line(-30, 590, :at => 350)
        #stroke_vertical_line(720, 0, :at => 263)
    end
end