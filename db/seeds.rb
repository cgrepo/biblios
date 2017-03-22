# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Library.destroy_all
School.destroy_all
Group.destroy_all

Library.create! [ 
    { name:'Biblioteca Pública Profra. Amelia Wilkes Ceseña', address:'Delegacion CSL', telephone:'14 3 09 49', number:4072 } ]
School.create! [
    { name:'ITES LOS CABOS', shortname: 'ITES', responsable:'', email:'', telephone:'', library: Library.find_by(number:4072) },
    { name:'ESC. SECUNDARIA TECNICA #18', shortname: 'TECNICA #18', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'CECYTE', shortname: 'CECYT', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'INSTITUTO PRADO', shortname: 'INST. PRADO', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'UNIVERSIDAD DE TIJUANA', shortname: 'UNIV. DE TIJUANA', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'UNIVESIDAD AUTONOMA DE B.C.S', shortname: 'UABCS', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'COBACH PLANTEL #10', shortname: 'COBACH', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC.PRIMARIA ROSARIO MORALES', shortname: 'ROSARIO MORALES', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'COLEGIO SAN AGUSTIN', shortname: 'SAN AGUSTIN', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC. PRIMARIA JESUS CASTRO AGUNDEZ', shortname: 'JESUS CASTRO', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'NARCIZO MENDOZA T.V', shortname: 'NARCIZO MENDOZA', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC. SEC. MOISES SAENZ GARZA', shortname: 'MOISES SAENZ', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'CET-MAR#31', shortname: 'CET-MAR', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC. PRIMARIA ILDEFONSO GREEN', shortname: 'ILDEFONSO GREEN', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC.PRIMARIA JOSE LUCAS MANRIQUEZ', shortname: 'JOSE LUCAS', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'COBACH #04', shortname: 'COBACH #04', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'PRIM. LEONARDO GASTELUM', shortname: 'LEONARDO GASTELUM', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'COLEGIO PENINSULA', shortname: '', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'INSTITUTO SANTA MARIA', shortname: 'SANTA MARIA', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'COLEGIO CYD', shortname: 'CYD', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ARTURO GUERRERO GONZALEZ', shortname: 'ARTURO GUERERO', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'COLEGIO COLIBRI', shortname: 'COLIBRI', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESCUELA SEC TECNICA No.19', shortname: 'TEC. 19', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'COLEGIO EL CAMINO', shortname: 'COLEGIO EL CAMINO', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC. PRIMARIA RAMON GREEN', shortname: 'RAMON GREEN', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC. PRIMARIA PROF. AMELIA WILKES C.', shortname: 'AMELIA WILKES', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC. SECUNDARIA MOISES SAENZ GARZA', shortname: 'SAENZ GARZA', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'OTROS', shortname: 'TRABAJO', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'GENERAL #35 RAUL ENRIQUE GRO. MONTAÑO', shortname: 'GENERAL #35', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    { name:'ESC. PRIMARIA LEON COTA COLLINS', shortname: 'LEON COTA', responsable:'', email:'', telephone:'',library: Library.find_by(number:4072) },
    ]
Group.create! [
    { description:'ALUMNO', books: 3,penalty: 0, returnDay: 7,renovation: 2,vigencyStar:'', vigencyEnd:'', library: Library.find_by(number:4072) },
    { description:'MAESTRO', books: 3,penalty: 0, returnDay: 7,renovation: 2,vigencyStar:'', vigencyEnd:'', library: Library.find_by(number:4072) },
    { description:'INVESTIGADOR', books: 3,penalty: 0, returnDay: 7,renovation: 2,vigencyStar:'', vigencyEnd:'', library: Library.find_by(number:4072) },
    { description:'TRABAJADOR BIBLIOTECARIO', books: 3,penalty: 0, returnDay: 7,renovation: 2,vigencyStar:'', vigencyEnd:'', library: Library.find_by(number:4072) },
    { description:'OTRO', books: 3,penalty: 0, returnDay: 7,renovation: 2,vigencyStar:'', vigencyEnd:'', library: Library.find_by(number:4072) }
    ]