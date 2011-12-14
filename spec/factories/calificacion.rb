Factory.define :calificacion do |f|
  f.puntualidad 5.3
  f.amigable 4
  f.conocimiento 5
  f.claridad 3
  f.flexibilidad 9
  f.promedio 5.26
  f.facilidad 8.4
  f.calificacion_obtenida 95
  f.usuario {|a| a.association(:usuario)}
  f.curso_profesor {|a| a.association(:curso_profesor)}
end