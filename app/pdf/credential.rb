class Credential < Prawn::Document
    def initialize(subscriptor)
        super()
        stroke_axis
#-----------FIRST BOX----------------------------------------------------
        bounding_box([10, 715], :width => 270, :height => 155) do
            transparent(1) {stroke_bounds}
        end
        text_box("""Se acredita al lector para:
            * Obtener en préstamo a domicilia hasta tres libros
              simultáneamente durante una semana.
            * Renovar el préstamo siempre que otra persona no lo
              haya solicitado.
            * Apartar libros que se encuentren prestados.
            El lector se obliga a:
            * Conservar en buen estado los materiales de la biblioteca
            * Devolver los libros prestados a domicilio en la fecha
              indicada""", at:[20,700], size:8, width:200, height:200)
        text_box("""Firma del lector                        Firma del encargado de la biblioteca""", at:[30,570], size:8)
#-----------SECOND BOX------------------------------------------------------------------
        bounding_box([10, 555], :width => 270, :height => 155) do
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
        text_box("Biblioteca No. 345", at:[190,500], size:8)
        text_box("Lector: #{subscriptor.fullname}", at:[120,479], size:8)
        #stroke_rectangle [120,449], 155,30
        text_box("Domicilio: #{subscriptor.address}", at:[120,460], size:8, width:155, height:30 )
        text_box("Fecha de vencimiento: #{subscriptor.vigencyStart}", at:[120,415], size:8)
#-----------SHAPES-----------------------------------------------------------------------
        stroke do
            self.line_width = 0.5
            horizontal_line 20,270, at:520
            horizontal_line 20,270, at:515
            
            horizontal_line 240,270, at:493
            horizontal_line 130,270, at:470
            horizontal_line 157,270, at:453
            horizontal_line 120,270, at:445
            horizontal_line 120,270, at:437
            horizontal_line 199,270, at:407
            
            rectangle [25,500], 70,90
            image subscriptor.picture.file.path, width:70, height:90, at:[25,500]
            #picture = subscriptor.picture.file.path
            #image picture, at: [25,500]
    	end
    end
end