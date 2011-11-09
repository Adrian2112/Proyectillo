# encoding: utf-8

require 'rubygems'
require 'nokogiri'
require 'open-uri'

URLS = ["http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/agricultura+y+alimentos/ia",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/agricultura+y+alimentos/iab",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/agricultura+y+alimentos/iia",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/arquitectura/arq",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ciencias+sociales+y+humanidades/lcs",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ciencias+sociales+y+humanidades/lec",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ciencias+sociales+y+humanidades/lef",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ciencias+sociales+y+humanidades/lep",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ciencias+sociales+y+humanidades/lle",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ciencias+sociales+y+humanidades/lpl",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ciencias+sociales+y+humanidades/lri",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/comunicacion+y+periodismo/lcmd",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/comunicacion+y+periodismo/lmi",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/derecho/ldc",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/derecho/ldf",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/derecho/ldp",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/derecho/led",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/diseno+y+arte+aplicado/lad",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/diseno+y+arte+aplicado/ldi",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ibn",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ibt",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ic",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ida",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ids",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ifi",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/iis",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ima",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/ime",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/imi",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/imt",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/iqa",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/iqp",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/ingenieria+y+ciencias/lcq",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lac",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lae",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/laf",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lati",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lcde",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lcpf",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/ldn",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lem",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lin",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lln",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lmc",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/negocios+y+administracion/lpo",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/salud/imd",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/salud/las",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/salud/lce",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/salud/lnb",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/salud/mc",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/salud/mo",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/int",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/isc",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/isd",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/itc",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/ite",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/itic",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/itm",
        "http://www.itesm.edu/wps/wcm/connect/itesm/tecnologico+de+monterrey/carreras+profesionales/areas+de+estudio/tecnologias+de+informacion+y+electronica/its"]

task :crear_cursos => :environment do
  ActiveRecord::Base.connection.execute("TRUNCATE cursos")
  cursos = []
  URLS.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".LinkMateria").each do |item|
      cursos << item.text
    end
  end
  
  cursos.delete_if {|string| string.include?("Tópico") or string.include?("Optativa")}
  cursos = cursos.uniq
  
  cursos.each do |curso|
    Curso.create!(:nombre => curso,
                  :campus_id => 15)
  end
  
end