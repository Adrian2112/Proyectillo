Factory.define :profesor do |f|
  f.nombre "Antonio"
  f.apellido_paterno "Mejorado"
  f.apellido_materno "Gonzalez"
  f.association :campus, :factory => :campus
  f.cursos {|a| [a.association(:curso)]}
end
