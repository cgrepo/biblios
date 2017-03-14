class Credential < Prawn::Document
    def initialize(subscriptor)
        super()
        stroke_axis
        bounding_box([10, 715], :width => 250, :height => 220) do
            move_down 10
            font_size(10) {text "RED NACIONAL DE BIBLIOTECAS PUBLICAS", align: :center}
            font_size(9) { text "SERVICIO DE PRESTAMO A DOMICILIO", align: :center}
            transparent(1) {stroke_bounds}
            horizontal_line 25,645, at:680
    	    #stroke_axis
        end
        #stroke_axis(:at => [5,680], :height => 200, :color => 'FF0000')
        stroke do
            self.line_width = 0.5
            horizontal_line 20,250, at:680
            horizontal_line 20,250, at:675
    	end
    end
end