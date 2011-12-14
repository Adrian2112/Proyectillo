Factory.define :profesor do |f|
  f.nombre "Antonio"
  f.apellido_paterno "Mejorado"
  f.apellido_materno "Gonzalez"
  f.sequence(:campus_id) {|i| i}
  f.avatar "avatar.png"
  f.cursos {|a| [a.association(:curso)]}
end
